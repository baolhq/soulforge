-----------------------------------
--	            Races             --
-----------------------------------
-- Insert Playable Races
INSERT INTO races (name, perk, description) VALUES
('Human', '+1 Starting attribute point', 'A versatile and adaptable race, known for their balance in all attributes.'),
('High Elf', '+1 Intelligence', 'Graceful and intelligent beings, skilled in magic and archery.'),
('Wood Elf', '+1 Wisdom', 'A magical and nature-bound race, known for their mastery of arcane arts and harmony with the forest.'),
('Dark Elf', '+1 Dexterity', 'They are respected as skilled combatants, known for their stealth, agility, and mastery of dark magic and weapons.'),
('Dwarf', '+1 Constitution', 'Sturdy and strong, with a deep connection to the earth and mastery in crafting.'),
('Orc', '+1 Strength', 'A warrior race, fierce and strong, with a deep bond to nature and battle.'),
('Halfling', '+1 Luck', 'Small and nimble, known for their stealth and agility, often skilled in thievery.'),
('Tiefling', '+1 Charisma', 'A race with infernal heritage, often shunned, but gifted with dark powers and an affinity for magic.'),
('Vampire', '+1 Charisma', 'Undead beings that thrive on blood, known for their immortality, charm, and formidable combat skills.');

-- Insert Mob Races
INSERT INTO races (name, description) VALUES
('Goblin', 'Small, cunning creatures often found in caves or forests, known for their traps and quick attacks.'),
('Skeleton', 'Undead warriors animated by dark magic, often found in dungeons and tombs.'),
('Zombie', 'Slow, relentless undead creatures that hunger for the flesh of the living.'),
('Dragon', 'Mighty, ancient creatures with great strength and the ability to breathe fire.'),
('Golem', 'Stone or clay constructs animated by magic, typically used as guardians or servants.'),
('Wraith', 'Ghostly beings that dwell in the shadows, capable of draining life energy from their victims.');

-----------------------------------
--	            Runes             --
-----------------------------------
INSERT INTO runes (name) VALUES
('none'), ('aeth'), ('cynd'), ('vorn'), ('kalt'), 
('zeyr'), ('myr'), ('drak'), ('soln'), ('pyre'), 
('lith'), ('nys'), ('thyr'), ('eld'), ('varn'), 
('krym'), ('zhor'), ('bary'), ('orth'), ('ven'), 
('aeg'), ('lum'), ('tey'), ('firn'), ('mal'), 
('qor'), ('xyr'), ('wyn'), ('syr'), ('eryn');

-----------------------------------
--	           Rarities           --
-----------------------------------
INSERT INTO rarities (name) VALUES
('common'), ('uncommon'), ('rare'), ('superRare'),
('legendary'), ('unique'), ('secret');

-----------------------------------
--	         Status Types         --
-----------------------------------
INSERT INTO status_types (name) VALUES ('buff'), ('neutral'), ('debuff');

-----------------------------------
--	        Saving Throws         --
-----------------------------------
INSERT INTO saving_throws (name) VALUES
('none'), ('strength'), ('dexterity'), ('intelligence'),
('wisdom'), ('constitution'), ('charisma'), ('luck');

-----------------------------------
--	           Statuses           --
-----------------------------------
-- Insert Buff Statuses
INSERT INTO statuses (name, description, duration, status_type_id, saving_throw_id) VALUES
('Strengthened', 'Increases strength, making physical attacks more powerful.', 3, 1, 2),  -- Buff, Strength saving throw
('Hasted', 'Increases speed and agility, allowing for quicker actions.', 5, 1, 3),       -- Buff, Dexterity saving throw
('Mana Shield', 'Absorbs incoming damage with mana before health is affected.', 10, 1, 4), -- Buff, Intelligence saving throw
('Regeneration', 'Gradually restores health over time.', 5, 1, 6);                    -- Buff, Constitution saving throw

-- Insert Neutral Statuses
INSERT INTO statuses (name, description, duration, status_type_id, saving_throw_id) VALUES
('Invisible', 'The character becomes invisible, avoiding detection.', 5, 2, NULL),        -- Neutral, No saving throw
('Stunned', 'The character is stunned and unable to take action for a brief period.', 2, 2, NULL), -- Neutral, No saving throw
('Slow', 'Reduces movement speed, making it harder to act quickly.', 3, 2, 3);           -- Neutral, Dexterity saving throw

-- Insert Debuff Statuses
INSERT INTO statuses (name, description, duration, status_type_id, saving_throw_id) VALUES
('Poisoned', 'The character suffers damage over time as they are poisoned.', 5, 3, 6),      -- Debuff, Constitution saving throw
('Cursed', 'Reduces all attributes and weakens abilities.', 6, 3, 7),                   -- Debuff, Charisma saving throw
('Burning', 'The character takes damage over time from fire.', 3, 3, 3),                  -- Debuff, Dexterity saving throw
('Paralyzed', 'The character is completely paralyzed and unable to act.', 4, 3, 5),        -- Debuff, Wisdom saving throw
('Frozen', 'The character is frozen in place and cannot move or act.', 3, 3, 5),          -- Debuff, Wisdom saving throw
('Petrified', 'The character turns to stone and cannot act.', 6, 3, 5),                   -- Debuff, Wisdom saving throw
('Bleeding', 'The character takes damage over time due to continuous wounds.', 5, 3, 6),   -- Debuff, Constitution saving throw
('Stunned', 'The character is stunned and unable to take any actions for a short period.', 2, 3, NULL),  -- Debuff, No saving throw
('Blinded', 'The character cannot see and suffers disadvantage on attacks and defense.', 4, 3, 3); -- Debuff, Dexterity saving throw

-----------------------------------
--	         Skill Types          --
-----------------------------------
INSERT INTO skill_types (name) VALUES ('single'), ('multiple'), ('self');

-----------------------------------
--	         Weapon Types         --
-----------------------------------
INSERT INTO weapon_types (name) VALUES
('sword'), ('polearms'), ('staff'), ('wand'), ('axe'),
('hammer'), ('mace'), ('claws'), ('fists'),
('bow'), ('crossbow'), ('smallShield'), ('mediumShield'), ('greatShield');

-----------------------------------
--	       Equipment Slots        --
-----------------------------------
INSERT INTO equipment_slots (name) VALUES
('helm'), ('torso'), ('bracelets'), ('greaves'), ('belt'),
('amulet'), ('leftRing'), ('rightRing');

-----------------------------------
--	          NPC Roles           --
-----------------------------------
INSERT INTO npc_roles (name) VALUES
('vendor'), ('questGiver'), ('trainer'), ('blacksmith');

-----------------------------------
--	           Genders            --
-----------------------------------
INSERT INTO genders (name) VALUES
('male'), ('female'), ('unknown');

-----------------------------------
--	           Classes            --
-----------------------------------
INSERT INTO classes (name) VALUES
('warrior'), ('paladin'), ('berserker'), ('monk'), ('samurai'),
('assassin'), ('sorceress'), ('wizard'), ('priest'), ('necromancer'),
('druid'), ('marksman'), ('archer');

-----------------------------------
--	         Quest Types          --
-----------------------------------
INSERT INTO quest_types (name) VALUES
('story'), ('side'), ('bounty'), ('secret');
