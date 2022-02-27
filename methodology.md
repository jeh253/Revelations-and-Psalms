# Updated Methodology

Our methodology involves tags with both elements and attributes, and we will be tagging words and phrases seen throughout the books of Revelations and Psalms in the Bible. The phrases and words that will be tagged will be specific to those that deal with emotional language. 

An example of this would be something like the phrase, "God, you have rejected us." This phrase would be tagged like so: `God, <emo_lang emotion="sorrow" tone="fear">you have rejected us</emo_lang>.`

*Full Breakdown*

TAGGING:
Includes the use of both attributes and elements; tagging both phrases and words

    Tags: 
      - emotions: `emo_lang`

    Attributes: 
      - specific emotion (listed below)
      - tone, tone2 (listed below)
      - speaker (still TBD)
          * is the speaker a divine entity: yes/no, they will be tagged 

  Emotions: Emotions are attributed based on whether or not the word or phrase reads as emotional language to   the (human) tagger. It is important to note that since the tagging is being done by three separate             individuals there will be slight variations of what is considered emotional language.
  
  The emotions that are listed as attributes are:
    - joy
    - sorrow
    - anger
    - contentment
    - fear

  Tone: Tone is attributed based on the way that the emotional phrase is being considered within it's context.   Tone has more than one option (tags `<tone>, <tone2>`) in the event that an emotional word or phrase may       be considered to fall under two of the following. It is important to note that since the tagging is being     done by three separate individuals there will be slight variations of what tone is attributed to each tag     with emotional language.
  
  The tones that are listed as attributes are:
    - Pleading
    - Petitioning
    - Violence
    - Boasting
    - Anxiety
    - Praise
    - Fear
    - Righteousness
