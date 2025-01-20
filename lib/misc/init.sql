-----------------------------------
--	            Items             --
-----------------------------------
CREATE TABLE IF NOT EXISTS items (
	id 					TEXT PRIMARY KEY NOT NULL,
	name 					TEXT NOT NULL,
	description 		TEXT NOT NULL,
	level_requirement	INTEGER NOT NULL,
	quantity				INTEGER NOT NULL,
	max_quantity		INTEGER NOT NULL,
	base_price			REAL NOT NULL,
	icon_path			TEXT NOT NULL,
	is_usable			INTEGER NOT NULL,
	is_quest_item		INTEGER NOT NULL,
	is_collectible		INTEGER NOT NULL,
	can_drop				INTEGER NOT NULL,
	drop_rate			REAL NOT NULL,
	is_rune				INTEGER NOT NULL,
	rune_type			TEXT CHECK(rune_type IN ('none', 'aeth', 'cynd', 'vorn', 'kalt', 'zeyr', 'myr', 'drak', 'soln',
															'pyre', 'lith', 'nys', 'thyr', 'eld', 'varn', 'krym', 'zhor', 'bary',
															'orth', 'ven', 'aeg', 'lum', 'tey', 'firn', 'mal', 'qor', 'xyr', 'wyn', 'syr', 'eryn')) NOT NULL,
	rarity				TEXT CHECK(rarity IN ('common', 'uncommon', 'rare', 'superRare', 'legendary', 'unique', 'secret')) NOT NULL,
	owner_id				TEXT NOT NULL,
	FOREIGN KEY(owner_id) REFERENCES characters(id)
);

CREATE TABLE IF NOT EXISTS item_craftings (
	id 					TEXT PRIMARY KEY NOT NULL,
	result_id			TEXT NOT NULL,
	material_id			TEXT NOT NULL,
	FOREIGN KEY(result_id) REFERENCES items(id),
	FOREIGN KEY(material_id) REFERENCES items(id)
);

-----------------------------------
--	          Statuses            --
-----------------------------------
CREATE TABLE IF NOT EXISTS statuses (
	id 					TEXT PRIMARY KEY NOT NULL,
	name 					TEXT NOT NULL,
	description 		TEXT NOT NULL,
	duration				INTEGER NOT NULL,
	status_type			TEXT CHECK(status_type IN ('buff', 'neutral', 'debuff')) NOT NULL,
	saving_throw		TEXT CHECK(status_type IN ('none', 'strength', 'dexterity', 'intelligence', 'wisdom', 'constitution', 'charisma', 'luck')) NOT NULL
);


-----------------------------------
--	            Magics            --
-----------------------------------
CREATE TABLE IF NOT EXISTS magics (
	id 					TEXT PRIMARY KEY NOT NULL,
	name 					TEXT NOT NULL,
	description 		TEXT NOT NULL,
	mana_cost 			INTEGER NOT NULL,
	duration 			INTEGER NOT NULL,
	accuracy 			REAL NOT NULL,
	recharge 			REAL NOT NULL,
	is_recharging 		INTEGER NOT NULL,
	is_chargeable 		INTEGER NOT NULL,
	is_multi_target 	INTEGER NOT NULL,
	is_piercing 		INTEGER NOT NULL,
	magic_type 			TEXT CHECK(magic_type IN ('sorcery', 'enchantment')) NOT NULL
);

CREATE TABLE IF NOT EXISTS magic_statuses (
	id 							TEXT PRIMARY KEY NOT NULL,
	magic_id						TEXT NOT NULL,
	status_id					TEXT NOT NULL,
	FOREIGN KEY(magic_id) 	REFERENCES magics(id),
	FOREIGN KEY(status_id) 	REFERENCES statuses(id)
);

CREATE TABLE IF NOT EXISTS magic_prerequisites (
	id 								TEXT PRIMARY KEY NOT NULL,
	magic_id							TEXT NOT NULL,
	required_id						TEXT NOT NULL,
	FOREIGN KEY(magic_id) 		REFERENCES magics(id),
	FOREIGN KEY(required_id) 	REFERENCES magics(id)
);

-----------------------------------
--	            Skills            --
-----------------------------------
CREATE TABLE IF NOT EXISTS skills (
	id 					TEXT PRIMARY KEY NOT NULL,
	name 					TEXT NOT NULL,
	description 		TEXT NOT NULL,
	mana_cost 			INTEGER NOT NULL,
	duration 			INTEGER NOT NULL,
	accuracy 			REAL NOT NULL,
	recharge 			REAL NOT NULL,
	is_recharging 		INTEGER NOT NULL,
	is_chargeable 		INTEGER NOT NULL,
	is_multi_target 	INTEGER NOT NULL,
	is_piercing 		INTEGER NOT NULL,
	skill_type 			TEXT CHECK(skill_type IN ('single', 'multiple', 'self')) NOT NULL
);

CREATE TABLE IF NOT EXISTS skill_statuses (
	id 							TEXT PRIMARY KEY NOT NULL,
	skill_id						TEXT NOT NULL,
	status_id					TEXT NOT NULL,
	FOREIGN KEY(skill_id) 	REFERENCES skills(id),
	FOREIGN KEY(status_id) 	REFERENCES statuses(id)
);

CREATE TABLE IF NOT EXISTS skill_prerequisites (
	id 								TEXT PRIMARY KEY NOT NULL,
	skill_id							TEXT NOT NULL,
	required_id						TEXT NOT NULL,
	FOREIGN KEY(skill_id) 		REFERENCES skills(id),
	FOREIGN KEY(required_id) 	REFERENCES skills(id)
);

-----------------------------------
--	           Weapons            --
-----------------------------------
CREATE TABLE IF NOT EXISTS weapons (
	id									TEXT PRIMARY KEY NOT NULL,
	weight							REAL NOT NULL,
	damage_multiplier				REAL NOT NULL,
	attack_rating_multiplier	REAL NOT NULL,
	crit_chance						REAL NOT NULL,
	min_damage						REAL NOT NULL,
	max_damage						REAL NOT NULL,
	base_upgrade_price			REAL NOT NULL,
	upgrade_level					INTEGER NOT NULL,
	weapon_type						TEXT CHECK(weapon_type IN ('sword', 'polearms', 'staff', 'wand', 'axe', 'hammer', 'mace', 'claws', 'fists',
																			'bow', 'crossbow', 'smallShield', 'mediumShield', 'greatShield')) NOT NULL,
	FOREIGN KEY(id) REFERENCES items(id)
);

CREATE TABLE IF NOT EXISTS weapon_statuses (
	id				TEXT PRIMARY KEY NOT NULL,
	weapon_id	TEXT NOT NULL,
	status_id	TEXT NOT NULL,
	FOREIGN KEY(weapon_id) REFERENCES weapons(id),
	FOREIGN KEY(status_id) REFERENCES statuses(id)
);

CREATE TABLE IF NOT EXISTS weapon_magics (
	id				TEXT PRIMARY KEY NOT NULL,
	weapon_id	TEXT NOT NULL,
	magic_id		TEXT NOT NULL,
	FOREIGN KEY(weapon_id) REFERENCES weapons(id),
	FOREIGN KEY(magic_id) REFERENCES magics(id)
);

CREATE TABLE IF NOT EXISTS weapon_skills (
	id				TEXT PRIMARY KEY NOT NULL,
	weapon_id	TEXT NOT NULL,
	skill_id		TEXT NOT NULL,
	FOREIGN KEY(weapon_id) REFERENCES weapons(id),
	FOREIGN KEY(skill_id) REFERENCES skills(id)
);

-----------------------------------
--	            Armors            --
-----------------------------------
CREATE TABLE IF NOT EXISTS armors (
	id									TEXT PRIMARY KEY NOT NULL,
	weight							REAL NOT NULL,
	durability						REAL NOT NULL,
	base_upgrade_price			REAL NOT NULL,
	upgrade_level					INTEGER NOT NULL,
	physical_resistance			REAL NOT NULL,
	magic_resistance				REAL NOT NULL,
	fire_resistance				REAL NOT NULL,
	cold_resistance				REAL NOT NULL,
	lightning_resistance			REAL NOT NULL,
	poison_resistance				REAL NOT NULL,
	equipment_slot					TEXT CHECK(equipment_slot IN ('helm', 'torso', 'bracelets', 'greaves', 'belt',
																				'amulet', 'leftRing', 'rightRing')) NOT NULL,
	FOREIGN KEY(id) REFERENCES items(id)
);

-----------------------------------
--	             Areas            --
-----------------------------------
CREATE TABLE IF NOT EXISTS areas (
	id 				TEXT PRIMARY KEY NOT NULL,
	name 				TEXT NOT NULL,
	description 	TEXT NOT NULL
);

-----------------------------------
--	           Locations          --
-----------------------------------
CREATE TABLE IF NOT EXISTS locations (
	id 						TEXT PRIMARY KEY NOT NULL,
	name 						TEXT NOT NULL,
	description 			TEXT NOT NULL,
	level_requirement		INTEGER NOT NULL,
	spawn_rate				REAL NOT NULL,
	area_id					TEXT NOT NULL,
	FOREIGN KEY(area_id) REFERENCES areas(id)
);

-----------------------------------
--	             NPCs            --
-----------------------------------
CREATE TABLE IF NOT EXISTS npcs (
	id 				TEXT PRIMARY KEY NOT NULL,
	name 				TEXT NOT NULL,
	background	 	TEXT NOT NULL,
	npc_role			TEXT CHECK(npc_role IN ('vendor', 'questGiver', 'trainer', 'blacksmith')) NOT NULL
);

-----------------------------------
--	            Vendors           --
-----------------------------------
CREATE TABLE IF NOT EXISTS vendors (
	id 						TEXT PRIMARY KEY NOT NULL,
	gold						INTEGER NOT NULL,
	bribeAmount				INTEGER NOT NULL,
	max_bribe_threshold 	INTEGER NOT NULL,
	FOREIGN KEY(id) REFERENCES npcs(id)
);

CREATE TABLE IF NOT EXISTS vendor_items (
	id				TEXT PRIMARY KEY NOT NULL,
	vendor_id	TEXT NOT NULL,
	item_id		TEXT NOT NULL,
	FOREIGN KEY(vendor_id) REFERENCES vendors(id),
	FOREIGN KEY(item_id) REFERENCES items(id)
);

-----------------------------------
--	             Races            --
-----------------------------------
CREATE TABLE IF NOT EXISTS races (
	id 				TEXT PRIMARY KEY NOT NULL,
	name 				TEXT NOT NULL,
	description 	TEXT NOT NULL
);

-----------------------------------
--	            Entity            --
-----------------------------------
CREATE TABLE IF NOT EXISTS entities (
	id 									TEXT PRIMARY KEY NOT NULL,
	name 									TEXT NOT NULL,
	current_level						INTEGER NOT NULL,
	health								REAL NOT NULL,
	max_health							REAL NOT NULL,
	temporary_health					REAL NOT NULL,
	mana									REAL NOT NULL,
	max_mana								REAL NOT NULL,
	gender								TEXT CHECK(gender IN ('male', 'female', 'unknown')) NOT NULL,
	icon_path							TEXT NOT NULL,
	race_id								TEXT NOT NULL,
	location_id							TEXT NOT NULL,
	
	strength								INTEGER NOT NULL,
	dexterity							INTEGER NOT NULL,
	intelligence						INTEGER NOT NULL,
	wisdom								INTEGER NOT NULL,
	constitution						INTEGER NOT NULL,
	charisma								INTEGER NOT NULL,
	luck									INTEGER NOT NULL,
	
	attack_damage						REAL NOT NULL,
	attack_damage_multiplier		REAL NOT NULL,
	attack_rating						REAL NOT NULL,
	attack_rating_multiplier		REAL NOT NULL,
	magic_damage_multiplier			REAL NOT NULL,
	fire_damage_multiplier			REAL NOT NULL,
	cold_damage_multiplier			REAL NOT NULL,
	lightning_damage_multiplier	REAL NOT NULL,
	poison_damage_multiplier		REAL NOT NULL,
	defense								REAL NOT NULL,
	crit_chance							REAL NOT NULL,
	evasion								REAL NOT NULL,
	initiative							INTEGER NOT NULL,
	
	physical_resistance				REAL NOT NULL,
	magic_resistance					REAL NOT NULL,
	fire_resistance					REAL NOT NULL,
	cold_resistance					REAL NOT NULL,
	lightning_resistance				REAL NOT NULL,
	poison_resistance					REAL NOT NULL,
	
	FOREIGN KEY(race_id) REFERENCES races(id),
	FOREIGN KEY(location_id) REFERENCES locations(id)
);

CREATE TABLE IF NOT EXISTS entity_skills (
	id 			TEXT PRIMARY KEY NOT NULL,
	entity_id	TEXT NOT NULL,
	skill_id		TEXT NOT NULL,
	FOREIGN KEY(entity_id) REFERENCES entities(id),
	FOREIGN KEY(skill_id) REFERENCES skills(id)
);

CREATE TABLE IF NOT EXISTS entity_magics (
	id 			TEXT PRIMARY KEY NOT NULL,
	entity_id	TEXT NOT NULL,
	magic_id		TEXT NOT NULL,
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
CREATE TABLE IF NOT EXISTS characters (
	id 					TEXT PRIMARY KEY NOT NULL,
	exp_multiplier		REAL NOT NULL,
	gold					INTEGER NOT NULL,
	discovery_rate		REAL NOT NULL,
	is_rescued			INTEGER NOT NULL,
	
	FOREIGN KEY(id) REFERENCES entities(id)
);

CREATE TABLE IF NOT EXISTS character_items (
	id 					TEXT PRIMARY KEY NOT NULL,
	character_id		TEXT NOT NULL,
	item_id				TEXT NOT NULL,
	FOREIGN KEY(character_id) REFERENCES characters(id),
	FOREIGN KEY(item_id) REFERENCES items(id)
);

CREATE TABLE IF NOT EXISTS character_classes (
	id 					TEXT PRIMARY KEY NOT NULL,
	character_id		TEXT NOT NULL,
	class					TEXT CHECK(class IN ('warrior', 'paladin', 'berserker', 'monk', 'samurai', 'assassin', 'sorceress', 'wizard',
														'priest', 'necromancer', 'druid', 'marksman', 'archer')) NOT NULL,
	FOREIGN KEY(character_id) REFERENCES characters(id)
);

-----------------------------------
--	       Treasure Classes       --
-----------------------------------
CREATE TABLE IF NOT EXISTS treasure_classes (
	id 					TEXT PRIMARY KEY NOT NULL,
	tier					INTEGER NOT NULL,
	total_drop_rate	REAL NOT NULL
);

CREATE TABLE IF NOT EXISTS treasure_class_items (
	id 						TEXT PRIMARY KEY NOT NULL,
	treasure_class_id		TEXT NOT NULL,
	item_id					TEXT NOT NULL,
	FOREIGN KEY(treasure_class_id) REFERENCES treasure_classes(id),
	FOREIGN KEY(item_id) REFERENCES items(id)
);

-----------------------------------
--	            Enemies           --
-----------------------------------
CREATE TABLE IF NOT EXISTS enemies (
	id							TEXT PRIMARY KEY NOT NULL,
	description 			TEXT NOT NULL,
	experience				INTEGER NOT NULL,
	gold						INTEGER NOT NULL,
	treasure_class_id		INTEGER NOT NULL,
	FOREIGN KEY(id) REFERENCES entities(id),
	FOREIGN KEY(treasure_class_id) REFERENCES treasure_classes(id)
);

-----------------------------------
--	            Quests            --
-----------------------------------
CREATE TABLE IF NOT EXISTS quests (
	id					TEXT PRIMARY KEY NOT NULL,
	name				TEXT NOT NULL,
	description		TEXT NOT NULL,
	quest_type		TEXT CHECK(quest_type IN ('story', 'side', 'bounty', 'secret')) NOT NULL,
	due_date			TEXT NOT NULL, -- Format: '2012-02-27 13:27:00'
	is_completed	INTEGER NOT NULL,
	is_active		INTEGER NOT NULL,
	is_repeatable	INTEGER NOT NULL,
	progress			INTEGER NOT NULL
);

-----------------------------------
--	           Parties            --
-----------------------------------
CREATE TABLE IF NOT EXISTS parties (
	id		TEXT PRIMARY KEY NOT NULL,
	name	TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS party_members (
	id					TEXT PRIMARY KEY NOT NULL,
	character_id	TEXT NOT NULL,
	FOREIGN KEY(character_id) REFERENCES characters(id)
);