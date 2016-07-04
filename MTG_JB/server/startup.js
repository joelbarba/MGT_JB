import { Meteor } from 'meteor/meteor';

Meteor.startup(() => {
  // code to run on server at startup

  if (!Card_templates.findOne()) {
    console.log("No data yet. Initializing.");

    Card_templates.insert(
      { card_code   : 0,
        name        : 'Island',
        color       : 1,
        card_type   : 0,
        cost_summon : [0,0,0,0,0,0],
        card_text   : 'Tab to add 1 blue mana to your mana pool',
        atack       : null,
        defend      : null,
        image_file  : null
      });
    Card_templates.insert(
    { card_code   : 1,
      name        : 'Plain',
      color       : 2,
      card_type   : 0,
      cost_summon : [0,0,0,0,0,0],
      card_text   : 'Tab to add 1 white mana to your mana pool',
      atack       : null,
      defend      : null,
      image_file  : null
    });
    Card_templates.insert(
    { card_code   : 2,
      name        : 'Swamp',
      color       : 3,
      card_type   : 0,
      cost_summon : [0,0,0,0,0,0],
      card_text   : 'Tab to add 1 black mana to your mana pool',
      atack       : null,
      defend      : null,
      image_file  : null
    });
    Card_templates.insert(
    { card_code   : 3,
      name        : 'Mountain',
      color       : 4,
      card_type   : 0,
      cost_summon : [0,0,0,0,0,0],
      card_text   : 'Tab to add 1 red mana to your mana pool',
      atack       : null,
      defend      : null,
      image_file  : null
    });
    Card_templates.insert(
    { card_code   : 4,
      name        : 'Forest',
      color       : 5,
      card_type   : 0,
      cost_summon : [0,0,0,0,0,0],
      card_text   : 'Tab to add 1 green mana to your mana pool',
      atack       : null,
      defend      : null,
      image_file  : null
    });
  }

});
