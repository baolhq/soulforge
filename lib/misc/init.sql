-----------------------------------
--	            Items             --
-----------------------------------
CREATE TABLE IF NOT EXISTS runes (
	id		INTEGER PRIMARY KEY AUTOINCREMENT,
	name	TEXT UNIQUE NOT NULL
);

CREATE TABLE rarities (
   id 	INTEGER PRIMARY KEY AUTOINCREMENT,
   name 	TEXT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS items (
	id 					INTEGER PRIMARY KEY AUTOINCREMENT,
	name 					TEXT NOT NULL,
	description 		TEXT,
	level_requirement	INTEGER,
	quantity				INTEGER NOT NULL DEFAULT 1,
	max_quantity		INTEGER,
	weight				REAL NOT NULL DEFAULT 0.0,
	base_price			REAL NOT NULL DEFAULT 0,
	icon_path			TEXT,
	is_usable			INTEGER NOT NULL DEFAULT 1,
	is_quest_item		INTEGER NOT NULL DEFAULT 0,
	is_collectible		INTEGER NOT NULL DEFAULT 1,
	can_drop				INTEGER NOT NULL DEFAULT 1,
	drop_rate			REAL NOT NULL DEFAULT 10.0,
	rune_id				INTEGER,
	rarity_id			INTEGER NOT NULL DEFAULT 1,
	owner_id				INTEGER NOT NULL,
	
	FOREIGN KEY(rune_id) REFERENCES runes(id),
	FOREIGN KEY(rarity_id) REFERENCES rarities(id),
	FOREIGN KEY(owner_id) REFERENCES entities(id)
);

CREATE TABLE IF NOT EXISTS item_craftings (
	id 					INTEGER PRIMARY KEY AUTOINCREMENT,
	result_id			INTEGER NOT NULL,
	material_id			INTEGER NOT NULL,
	
	FOREIGN KEY(result_id) REFERENCES items(id),
	FOREIGN KEY(material_id) REFERENCES items(id)
);

-----------------------------------
--	          Statuses            --
-----------------------------------
CREATE TABLE status_types (
   id 	INTEGER PRIMARY KEY AUTOINCREMENT,
   name 	TEXT UNIQUE NOT NULL
);

CREATE TABLE saving_throws (
   id 	INTEGER PRIMARY KEY AUTOINCREMENT,
   name 	TEXT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS statuses (
	id 					INTEGER PRIMARY KEY AUTOINCREMENT,
	name 					TEXT NOT NULL,
	description 		TEXT,
	duration				INTEGER,
	status_type_id		INTEGER NOT NULL DEFAULT 1,
	saving_throw_id	INTEGER,
	
	FOREIGN KEY(status_type_id) REFERENCES status_types(id),
	FOREIGN KEY(saving_throw_id) REFERENCES saving_throws(id)
);

-----------------------------------
--	            Skills            --
-----------------------------------
CREATE TABLE IF NOT EXISTS skill_types(
	id 	INTEGER PRIMARY KEY AUTOINCREMENT,
	name 	TEXT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS skills (
	id 					INTEGER PRIMARY KEY AUTOINCREMENT,
	name 					TEXT UNIQUE NOT NULL,
	description 		TEXT,
	mana_cost 			INTEGER NOT NULL DEFAULT 0,
	duration 			INTEGER,
	accuracy 			REAL,
	recharge 			REAL,
	is_recharging 		INTEGER NOT NULL DEFAULT 0,
	is_chargeable 		INTEGER NOT NULL DEFAULT 0,
	is_multi_target 	INTEGER NOT NULL DEFAULT 0,
	is_piercing 		INTEGER NOT NULL DEFAULT 0,
	skill_type_id 		INTEGER NOT NULL DEFAULT 1,
	
	FOREIGN KEY(skill_type_id) REFERENCES skill_types(id)
);

CREATE TABLE IF NOT EXISTS skill_statuses (
	id 							INTEGER PRIMARY KEY AUTOINCREMENT,
	skill_id						INTEGER NOT NULL,
	status_id					INTEGER NOT NULL,
	
	FOREIGN KEY(skill_id) 	REFERENCES skills(id),
	FOREIGN KEY(status_id) 	REFERENCES statuses(id)
);

CREATE TABLE IF NOT EXISTS skill_prerequisites (
	id 								INTEGER PRIMARY KEY AUTOINCREMENT,
	skill_id							INTEGER NOT NULL,
	required_id						INTEGER NOT NULL,
	
	FOREIGN KEY(skill_id) 		REFERENCES skills(id),
	FOREIGN KEY(required_id) 	REFERENCES skills(id)
);

-----------------------------------
--	           Weapons            --
-----------------------------------
CREATE TABLE IF NOT EXISTS weapon_types(
	id		INTEGER PRIMARY KEY AUTOINCREMENT,
	name	TEXT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS weapons (
	id									INTEGER PRIMARY KEY AUTOINCREMENT,
	damage_multiplier				REAL NOT NULL DEFAULT 1.0,
	attack_rating_multiplier	REAL NOT NULL DEFAULT 1.0,
	crit_chance						REAL NOT NULL DEFAULT 0.0,
	min_damage						REAL NOT NULL DEFAULT 1.0,
	max_damage						REAL NOT NULL DEFAULT 1.0,
	base_upgrade_price			REAL NOT NULL,
	upgrade_level					INTEGER NOT NULL DEFAULT 0,
	weapon_type_id					INTEGER NOT NULL DEFAULT 1,
	
	FOREIGN KEY(id) REFERENCES items(id),
	FOREIGN KEY(weapon_type_id) REFERENCES weapon_types(id)
);

CREATE TABLE IF NOT EXISTS weapon_statuses (
	id				INTEGER PRIMARY KEY AUTOINCREMENT,
	weapon_id	INTEGER NOT NULL,
	status_id	INTEGER NOT NULL,
	
	FOREIGN KEY(weapon_id) REFERENCES weapons(id),
	FOREIGN KEY(status_id) REFERENCES statuses(id)
);

CREATE TABLE IF NOT EXISTS weapon_skills (
	id				INTEGER PRIMARY KEY AUTOINCREMENT,
	weapon_id	INTEGER NOT NULL,
	skill_id		INTEGER NOT NULL,
	
	FOREIGN KEY(weapon_id) REFERENCES weapons(id),
	FOREIGN KEY(skill_id) REFERENCES skills(id)
);

-----------------------------------
--	            Armors            --
-----------------------------------
CREATE TABLE equipment_slots (
   id INTEGER PRIMARY KEY AUTOINCREMENT,
   name TEXT UNIQUE NOT NULL
);


CREATE TABLE IF NOT EXISTS armors (
	id									INTEGER PRIMARY KEY AUTOINCREMENT,
	durability						REAL NOT NULL DEFAULT 100.0,
	base_upgrade_price			REAL NOT NULL,
	upgrade_level					INTEGER NOT NULL DEFAULT 0,
	physical_resistance			REAL NOT NULL DEFAULT 0,
	magic_resistance				REAL NOT NULL DEFAULT 0,
	fire_resistance				REAL NOT NULL DEFAULT 0,
	cold_resistance				REAL NOT NULL DEFAULT 0,
	lightning_resistance			REAL NOT NULL DEFAULT 0,
	poison_resistance				REAL NOT NULL DEFAULT 0,
	equipment_slot_id				INTEGER NOT NULL DEFAULT 1,
	
	CONSTRAINT durability_check
		CHECK(durability >= 0.0 AND durability <= 100.0),
	
	FOREIGN KEY(id) REFERENCES items(id),
	FOREIGN KEY(equipment_slot_id) REFERENCES equipment_slots(id)
);

-----------------------------------
--	             Areas            --
-----------------------------------
CREATE TABLE IF NOT EXISTS areas (
	id 				INTEGER PRIMARY KEY AUTOINCREMENT,
	name 				TEXT UNIQUE NOT NULL,
	description 	TEXT
);

-----------------------------------
--	           Locations          --
-----------------------------------
CREATE TABLE IF NOT EXISTS locations (
	id 						INTEGER PRIMARY KEY AUTOINCREMENT,
	name 						TEXT UNIQUE NOT NULL,
	description 			TEXT,
	level_requirement		INTEGER,
	spawn_rate				REAL,
	area_id					INTEGER NOT NULL,
	
	FOREIGN KEY(area_id) REFERENCES areas(id)
);

-----------------------------------
--	             NPCs            --
-----------------------------------
CREATE TABLE npc_roles (
   id INTEGER PRIMARY KEY AUTOINCREMENT,
   name TEXT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS npcs (
	id 				INTEGER PRIMARY KEY AUTOINCREMENT,
	name 				TEXT UNIQUE NOT NULL,
	background	 	TEXT,
	npc_role_id		INTEGER NOT NULL DEFAULT 1,
	
	FOREIGN KEY(npc_role_id) REFERENCES npc_roles(id)
);

-----------------------------------
--	            Vendors           --
-----------------------------------
CREATE TABLE IF NOT EXISTS vendors (
	id 						INTEGER PRIMARY KEY AUTOINCREMENT,
	gold						INTEGER NOT NULL DEFAULT 100,
	bribeAmount				INTEGER NOT NULL DEFAULT 0,
	max_bribe_threshold 	INTEGER NOT NULL DEFAULT 100,
	
	FOREIGN KEY(id) REFERENCES npcs(id)
);

CREATE TABLE IF NOT EXISTS vendor_items (
	id				INTEGER PRIMARY KEY AUTOINCREMENT,
	vendor_id	INTEGER NOT NULL,
	item_id		INTEGER NOT NULL,
	
	FOREIGN KEY(vendor_id) REFERENCES vendors(id),
	FOREIGN KEY(item_id) REFERENCES items(id)
);

-----------------------------------
--	             Races            --
-----------------------------------
CREATE TABLE IF NOT EXISTS races (
	id 				INTEGER PRIMARY KEY AUTOINCREMENT,
	name 				TEXT UNIQUE NOT NULL,
	description 	TEXT
);

-----------------------------------
--	            Entity            --
-----------------------------------
CREATE TABLE IF NOT EXISTS genders (
	id		INTEGER PRIMARY KEY AUTOINCREMENT,
	name	TEXT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS entities (
	id 									INTEGER PRIMARY KEY AUTOINCREMENT,
	name 									TEXT NOT NULL,
	current_level						INTEGER NOT NULL DEFAULT 1,
	health								REAL NOT NULL DEFAULT 100.0,
	max_health							REAL NOT NULL DEFAULT 100.0,
	temporary_health					REAL NOT NULL DEFAULT 0.0,
	mana									REAL NOT NULL DEFAULT 100.0,
	max_mana								REAL NOT NULL DEFAULT 100.0,
	gender_id							INTEGER NOT NULL DEFAULT 1,
	icon_path							TEXT,
	race_id								INTEGER NOT NULL DEFAULT 1,
	location_id							INTEGER NOT NULL DEFAULT 1,
	
	strength								INTEGER NOT NULL DEFAULT 1,
	dexterity							INTEGER NOT NULL DEFAULT 1,
	intelligence						INTEGER NOT NULL DEFAULT 1,
	wisdom								INTEGER NOT NULL DEFAULT 1,
	constitution						INTEGER NOT NULL DEFAULT 1,
	charisma								INTEGER NOT NULL DEFAULT 1,
	luck									INTEGER NOT NULL DEFAULT 1,
	
	attack_damage_multiplier		REAL NOT NULL DEFAULT 1.0,
	attack_rating						REAL NOT NULL DEFAULT 1.0,
	attack_rating_multiplier		REAL NOT NULL DEFAULT 1.0,
	magic_damage_multiplier			REAL NOT NULL DEFAULT 1.0,
	fire_damage_multiplier			REAL NOT NULL DEFAULT 1.0,
	cold_damage_multiplier			REAL NOT NULL DEFAULT 1.0,
	lightning_damage_multiplier	REAL NOT NULL DEFAULT 1.0,
	poison_damage_multiplier		REAL NOT NULL DEFAULT 1.0,
	crit_chance							REAL NOT NULL DEFAULT 10.0,
	evasion								REAL NOT NULL DEFAULT 10.0,
	
	physical_resistance				REAL NOT NULL DEFAULT 0.0,
	magic_resistance					REAL NOT NULL DEFAULT 0.0,
	fire_resistance					REAL NOT NULL DEFAULT 0.0,
	cold_resistance					REAL NOT NULL DEFAULT 0.0,
	lightning_resistance				REAL NOT NULL DEFAULT 0.0,
	poison_resistance					REAL NOT NULL DEFAULT 0.0,
	
	CONSTRAINT health_check
		CHECK(health >= 0 AND health <= max_health),
		
	CONSTRAINT mana_check
		CHECK(mana >= 0 AND mana <= max_mana),
	
	FOREIGN KEY(gender_id) REFERENCES genders(id),
	FOREIGN KEY(race_id) REFERENCES races(id),
	FOREIGN KEY(location_id) REFERENCES locations(id)
);

CREATE TABLE IF NOT EXISTS entity_skills (
	id 			INTEGER PRIMARY KEY AUTOINCREMENT,
	entity_id	INTEGER NOT NULL,
	skill_id		INTEGER NOT NULL,
	
	FOREIGN KEY(entity_id) REFERENCES entities(id),
	FOREIGN KEY(skill_id) REFERENCES skills(id)
);

CREATE TABLE IF NOT EXISTS entity_magics (
	id 			INTEGER PRIMARY KEY AUTOINCREMENT,
	entity_id	INTEGER NOT NULL,
	magic_id		INTEGER NOT NULL,
	
	FOREIGN KEY(entity_id) REFERENCES entities(id),
	FOREIGN KEY(magic_id) REFERENCES magics(id)
);

CREATE TABLE IF NOT EXISTS entity_statuses (
	id 			TEXT PRIMARY KEY NOT NULL,
	entity_id	TEXT NOT NULL,
	status_id		TEXT NOT NULL,
	
	FOREIGN KEY(entity_id) REFERENCES entities(id),
	FOREIGN KEY(status_id) REFERENCES statuses(id)
);

-----------------------------------
--	          Character           --
-----------------------------------
CREATE TABLE IF NOT EXISTS classes (
	id		INTEGER PRIMARY KEY AUTOINCREMENT,
	name	TEXT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS characters (
	id 					INTEGER PRIMARY KEY AUTOINCREMENT,
	exp_multiplier		REAL NOT NULL DEFAULT 1.0,
	gold					INTEGER NOT NULL DEFAULT 0,
	discovery_rate		REAL NOT NULL DEFAULT 100.0,
	is_fainted			INTEGER NOT NULL DEFAULT 0,
	is_rescued			INTEGER NOT NULL DEFAULT 0,
	
	CONSTRAINT discovery_rate_check
		CHECK(discovery_rate >= 0),
	
	FOREIGN KEY(id) REFERENCES entities(id)
);

CREATE TABLE IF NOT EXISTS character_items (
	id 					INTEGER PRIMARY KEY AUTOINCREMENT,
	character_id		INTEGER NOT NULL,
	item_id				INTEGER NOT NULL,
	
	FOREIGN KEY(character_id) REFERENCES characters(id),
	FOREIGN KEY(item_id) REFERENCES items(id)
);

CREATE TABLE IF NOT EXISTS character_classes (
	id 					INTEGER PRIMARY KEY AUTOINCREMENT,
	character_id		INTEGER NOT NULL,
	class_id				INTEGER NOT NULL DEFAULT 1,
	
	FOREIGN KEY(character_id) REFERENCES characters(id),
	FOREIGN KEY(class_id) REFERENCES classes(id)
);

-----------------------------------
--	       Treasure Classes       --
-----------------------------------
CREATE TABLE IF NOT EXISTS treasure_classes (
	id 					INTEGER PRIMARY KEY AUTOINCREMENT,
	tier					INTEGER UNIQUE NOT NULL DEFAULT 1,
	total_drop_rate	REAL NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS treasure_class_items (
	id 						INTEGER PRIMARY KEY AUTOINCREMENT,
	treasure_class_id		INTEGER NOT NULL,
	item_id					INTEGER NOT NULL,
	
	FOREIGN KEY(treasure_class_id) REFERENCES treasure_classes(id),
	FOREIGN KEY(item_id) REFERENCES items(id)
);

-----------------------------------
--	            Enemies           --
-----------------------------------
CREATE TABLE IF NOT EXISTS enemies (
	id							INTEGER PRIMARY KEY AUTOINCREMENT,
	description 			TEXT,
	experience				REAL NOT NULL DEFAULT 1.0,
	gold						INTEGER NOT NULL DEFAULT 1,
	treasure_class_id		INTEGER NOT NULL DEFAULT 1,
	
	FOREIGN KEY(id) REFERENCES entities(id),
	FOREIGN KEY(treasure_class_id) REFERENCES treasure_classes(id)
);

-----------------------------------
--	            Quests            --
-----------------------------------
CREATE TABLE IF NOT EXISTS quest_types (
	id 	INTEGER PRIMARY KEY AUTOINCREMENT,
	name	TEXT UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS quests (
	id					INTEGER PRIMARY KEY AUTOINCREMENT,
	name				TEXT NOT NULL,
	description		TEXT,
	quest_type_id	INTEGER NOT NULL DEFAULT 1,
	due_date			TEXT, -- Format: '2012-02-27 13:27:00'
	is_completed	INTEGER NOT NULL DEFAULT 0,
	is_active		INTEGER NOT NULL DEFAULT 0,
	is_repeatable	INTEGER NOT NULL DEFAULT 0,
	progress			REAL NOT NULL DEFAULT 0.0,
	
	FOREIGN KEY(quest_type_id) REFERENCES quest_types(id)
);

-----------------------------------
--	           Parties            --
-----------------------------------
CREATE TABLE IF NOT EXISTS parties (
	id		INTEGER PRIMARY KEY AUTOINCREMENT,
	name	TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS party_members (
	id					INTEGER PRIMARY KEY AUTOINCREMENT,
	name				TEXT UNIQUE NOT NULL,
	character_id	INTEGER NOT NULL,
	
	FOREIGN KEY(character_id) REFERENCES characters(id)
);

-----------------------------------
--	         Telemetries          --
-----------------------------------
CREATE TABLE IF NOT EXISTS player_actions (
	id                  INTEGER PRIMARY KEY AUTOINCREMENT,
	player_id           INTEGER NOT NULL,
	action_type         TEXT NOT NULL,
	action_details      TEXT,
	timestamp           TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);

CREATE TABLE IF NOT EXISTS game_events (
	id                  INTEGER PRIMARY KEY AUTOINCREMENT,
	event_type          TEXT NOT NULL,
	event_details       TEXT,
	location_id         INTEGER,
	timestamp           TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	
	FOREIGN KEY(location_id) REFERENCES locations(id)
);

CREATE TABLE IF NOT EXISTS session_data (
	session_id          INTEGER PRIMARY KEY AUTOINCREMENT,
	player_id           INTEGER NOT NULL,
	start_time          TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
	end_time            TIMESTAMP,
	total_duration      INTEGER,
	
	FOREIGN KEY(player_id) REFERENCES player(id)
);

CREATE TABLE IF NOT EXISTS error_logs (
	id                  INTEGER PRIMARY KEY AUTOINCREMENT,
	error_type          TEXT NOT NULL,
	error_message       TEXT NOT NULL,
	stack_trace         TEXT,
	timestamp           TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL
);