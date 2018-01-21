// IF YOU'RE GOING TO ADD NEW REAGENTS, MAKE SURE THEY GO IN HERE!
// This will keep future merges with mainline tg from breaking horribly and keep you from having to recode your stuff.

//WACKY GUSHER FLAVORS BELOW
/datum/reagent/toxin/gusherblack
	name = "Bodacious Black Liquid Sorrow Gusher Juice"
	id = "gusherblack"
	description = "the anti-healing one"
	reagent_state = LIQUID
	color = "#000000" // rgb: BLAPCK
	toxpwr = 3
	metabolization_rate = 2.5 * REAGENTS_METABOLISM
	taste_description = "oily fruit"

/datum/reagent/toxin/gusherblack/on_mob_life(mob/living/M)
	M.adjustBruteLoss(3*REM, 0)
	M.adjustFireLoss(3*REM, 0)
	M.adjustOxyLoss(3*REM, 0)
	. = 1
	..()

/datum/reagent/toxin/gushersyndie
	name = "Treachous Teal Tangerine Gusher Juice"
	id = "gushersyndie"
	description = "the unused poison one"
	reagent_state = LIQUID
	color = "#10E4C5" //rgb: 16, 228, 197
	toxpwr = 6
	metabolization_rate = 0.625 * REAGENTS_METABOLISM
	taste_mult = 0.05
	taste_description = "tangerine"

/datum/reagent/toxin/gushersyndie/on_mob_life(mob/living/carbon/M)
	M.silent = max(M.silent, 3)
	..()

/datum/reagent/toxin/gushercitrus
	name = "Carnivorous Citrus Piss Gusher Juice"
	id = "gushercitrus"
	description = "the emetic one"
	reagent_state = LIQUID
	color = "#A8DF00" //rgb: 168, 223, 0
	toxpwr = 0
	metabolization_rate = 2.5 * REAGENTS_METABOLISM
	taste_description = "your own vomit"

/datum/reagent/toxin/gushercitrus/on_mob_life(mob/living/M)
	var/mob/living/carbon/human/H = M
	if(current_cycle >= 1)
		H.vomit(1)
	..()

/datum/reagent/toxin/gusherkiwi
	name = "Xtreme Kiwi Xplosion Gusher Juice"
	id = "gusherkiwi"
	description = "the !!!FUN!!! one"
	reagent_state = LIQUID
	color = "#20A300" //rgb: 32, 163, 0
	toxpwr = 4
	metabolization_rate = 3.125 * REAGENTS_METABOLISM
	overdose_threshold = 55
	taste_description = "KIWIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII"
	var/deathtime = 0

/datum/reagent/toxin/gusherkiwi/on_mob_life(mob/living/M)
	if(current_cycle == 1)
		M.ForceContractDisease(new /datum/disease/appendicitis)
		M.visible_message("<span class='userdanger'>[M] clutches at [M.p_their()] groin and cries in pain!</span>")
		to_chat(M, "<span class='danger'>You feel like something exploded in your groin!</span>")
		. = 1
	..()

/datum/reagent/toxin/gusherkiwi/overdose_process(mob/living/M) //fucking GIBS you after a few seconds
	if(ishuman(M))
		if(current_cycle == 1)
			to_chat(M, "<span class='danger'>You feel pressure building up in your groin...</span>")
			deathtime += 1
		else if(current_cycle >= 1)
			deathtime += 1
	if(deathtime >= 10)
		M.visible_message("<span class='userdanger'>Holy shit! [M] explodes into a bloody mess!</span>")
		M.adjustBruteLoss(1000)
		M.spawn_gibs()
		M.spill_organs()
		M.spread_bodyparts()
	..()
	return

/datum/reagent/medicine/gusherphlegm
	name = "Hellacious Blue Phlegm Aneurysm Gusher Juice"
	id = "gusherphlegm"
	description = "the healing one"
	reagent_state = LIQUID
	color = "#008ED2" //rgb: 000, 142, 210
	metabolization_rate = 2.5 * REAGENTS_METABOLISM
	taste_description = "rotten fruit"

/datum/reagent/medicine/gusherphlegm/on_mob_life(mob/living/M)
	M.adjustBruteLoss(-3*REM, 0)
	M.adjustFireLoss(-3*REM, 0)
	M.adjustOxyLoss(-3*REM, 0)
	M.adjustToxLoss(-3*REM, 0)
	. = 1
	..()

/datum/reagent/consumable/gushertropical
	name = "Massive Tropical Brain Hemorrhage Gusher Juice"
	id = "gushertropical"
	description = "the base one"
	metabolization_rate = 2.5 * REAGENTS_METABOLISM
	reagent_state = LIQUID
	nutriment_factor = 3 * REAGENTS_METABOLISM
	color = "#F3AF33" // rgb: 243, 175, 051
	taste_description = "tropical punch"

/datum/reagent/consumable/gusherdiabetic
	name = "Jammin Sour Diabetic Coma Gusher Juice"
	id = "gusherdiabetic"
	description = "the other base one"
	reagent_state = LIQUID
	metabolization_rate = 2.5 * REAGENTS_METABOLISM
	nutriment_factor = 3 * REAGENTS_METABOLISM
	color = "#EAEAEA" //rgb: 234, 234, 234
	overdose_threshold = 30
	taste_description = "sugar and a severe lack of insulin"

/datum/reagent/drug/gushercherry
	name = "Wild Cherry Apeshit Apocalypse Gusher Juice"
	id = "gushercherry"
	description = "the speedy one"
	reagent_state = LIQUID
	color = "#DB3B30" //rgb: 219, 59, 48
	overdose_threshold = 10
	metabolization_rate = 5 * REAGENTS_METABOLISM
	taste_description = "an unholy amount of cherry"

/datum/reagent/drug/gushercherry/on_mob_life(mob/living/M)
	M.AdjustStun(-50, 0)
	M.AdjustKnockdown(-50, 0)
	M.AdjustUnconscious(-50, 0)
	M.adjustStaminaLoss(-3, 0)
	M.status_flags |= GOTTAGOREALLYFAST
	M.Jitter(5)
	M.adjustToxLoss(3)

/datum/reagent/drug/gushercherry/overdose_process(mob/living/M) //don't do cherry kids
	M.AdjustStun(100, 0)
	M.AdjustKnockdown(100, 0)
	M.adjustStaminaLoss(3, 0)
	M.adjustToxLoss(2)

/datum/reagent/drug/gusherstrawberry
	name = "Schizophrenic Strawberry Slam Gusher Juice"
	id = "gusherstrawberry"
	description = "the druggy one"
	reagent_state = LIQUID
	color = "#FF325B" //rgb: 255, 50, 91
	metabolization_rate = 3.125 * REAGENTS_METABOLISM
	taste_description = "fuzzy strawberries"

/datum/reagent/drug/gusherstrawberry/on_mob_life(mob/living/M)
	M.set_drugginess(25)
	if(prob(25))
		M.emote(pick("drools", "giggles"))
	if(M.hallucination < volume && prob(20))
		M.hallucination += 5
	..()

/datum/reagent/gusherblueberry
	name = "Bluespace Blueberry Genetic Reshuffle Gusher Juice"
	id = "gusherblueberry"
	description = "the teleportationy one"
	reagent_state = LIQUID
	color = "#00499B" //rgb: 0, 73, 155
	metabolization_rate = 2.5 * REAGENTS_METABOLISM
	taste_description = "blue and blueberry"

/datum/reagent/gusherblueberry/on_mob_life(mob/living/M, mob/living/carbon/M)
	..()
	if(current_cycle >= 1)
		var/bbeffect = rand(1, 100)
		var/bbrace = rand(1, 5)
		if(bbeffect >= 1 && bbeffect <= 5)
			M.hallucination += 20
		if(bbeffect >= 6 && bbeffect <= 10)
			M.adjust_fire_stacks(1)
		if(bbeffect >= 11 && bbeffect <= 15)
			M.adjustFireLoss(3*REM, 0)
		if(bbeffect >= 16 && bbeffect <= 20)
			M.adjustFireLoss(-3*REM, 0)
		if(bbeffect >= 21 && bbeffect <= 25)
			M.adjustBruteLoss(3*REM, 0)
		if(bbeffect >= 26 && bbeffect <= 30)
			M.adjustBruteLoss(-3*REM, 0)
		if(bbeffect >= 31 && bbeffect <= 35)
			M.adjustToxLoss(3*REM, 0)
		if(bbeffect >= 36 && bbeffect <= 40)
			M.adjustToxLoss(3*REM, 0)
		if(bbeffect >= 41 && bbeffect <= 45)
			var/turf/T = get_turf(holder.my_atom)
			for(var/turf/turf in range(1,T))
				new /obj/effect/hotspot(turf)
		if(bbeffect >= 46 && bbeffect <= 50)
			do_teleport(M, get_turf(M), (4), asoundin = 'sound/effects/phasein.ogg')
		if(bbeffect >= 51 && bbeffect <= 53)
			if(bbrace == 1)
				holder.add_reagent("stablemutationtoxin", 1)
			if(bbrace == 2)
				holder.add_reagent("trollmutationtoxin", 1)
			if(bbrace == 3)
				holder.add_reagent("lizardmutationtoxin", 1)
			if(bbrace == 4)
				holder.add_reagent("flymutationtoxin", 1)
			if(bbrace == 5)
				holder.add_reagent("skeletonmutationtoxin", 1)
		if(bbeffect == 100)
			M.ForceContractDisease(new /datum/disease/tuberculosis)
		else
			return

/datum/reagent/gusherdragonfruit
	name = "Passionate Pitaya Plasma Flood Gusher Juice"
	id = "gusherdragonfruit"
	description = "the firey one"
	reagent_state = LIQUID
	color = "#FF325F" //rgb:255, 050, 095
	metabolization_rate = 5 * REAGENTS_METABOLISM
	taste_description = "third-degree burns"

/datum/reagent/gusherdragonfruit/on_mob_life(mob/living/M)
	if (current_cycle == 1)
		M.adjust_fire_stacks(1)
	else
		var/turf/T = get_turf(holder.my_atom)
		for(var/turf/turf in range(2,T))
			new /obj/effect/hotspot(turf)
	..()

//WGW gusher : - )
/datum/reagent/gusherwatermelon
	name = "Woody Got Watermelon Gusher Juice"
	id = "gusherwatermelon"
	description = "One day while Andy was masturbating..."
	reagent_state = LIQUID
	color = "#FF9393" //rgb: 255, 147, 147
	metabolization_rate = 0.625 * REAGENTS_METABOLISM
	taste_description = "wood chips and watermelon"

/datum/reagent/gusherwatermelon/on_mob_life(mob/living/M)
	M.adjustBruteLoss(-4*REM, 0)
	M.adjustFireLoss(-4*REM, 0)
	M.adjustOxyLoss(-4*REM, 0)
	M.adjustToxLoss(-4*REM, 0)
	. = 1
	if(current_cycle == 1)
		to_chat(M, "<span class='userdanger'>You suddenly lose control of what you're saying! Oh no...</span>")
	if(current_cycle == 3)
		M.say("; One day while Andy was masturbating, Woody got wood.")
	if(current_cycle == 5)
		M.say("; He could no longer help himself!")
	if(current_cycle == 7)
		M.say("; He watched as Andy stroked his juicy kawaii cock.")
	if(current_cycle == 9)
		M.say("; He approached Andy which startled him and make him pee everywhere on the floor and on Woody too.")
	if(current_cycle == 11)
		M.say("; Being drenched in his urine made him harder than ever!")
	if(current_cycle == 13)
		M.say("; Woody: 'Andy Senpai! I'm alive and I want to be INSIDE OF YOU.'")
	if(current_cycle == 15)
		M.say("; Andy: 'Oh Woody Chan! I always knew you were alive! I want to stuff you up my kawaii ass!'")
	if(current_cycle == 17)
		M.say("; Woody grabbed a bunch of flavored lube and rubbed it all over his head.")
	if(current_cycle == 19)
		M.say("; Woody: 'Oh my! It's cherry flavored lube! Cherry is my favorite!'")
	if(current_cycle == 21)
		M.say("; Woody then stuffed his head up into Andy's tight ass!")
	if(current_cycle == 23)
		M.say("; The other toys around the room watched intently as Woody shoved his head back and forth into Andy's nice ass, continuously making a squishy wet noise.")
	if(current_cycle == 25)
		M.say("; The other toys also became aroused and they all gathered around Woody and Andy and started to urinate all over them, and then they started to masturbate.")
	if(current_cycle == 27)
		M.say("; Andy: 'Oh my goodness, Woody Chan! You are churning my insides up so well! Your nose is stimulating my prostate! OH YES!'")
	if(current_cycle == 29)
		M.say("; All the other toys became so aroused by this, that they could not help themselves anymore!")
	if(current_cycle == 31)
		M.say("; They pushed Woody completely inside, and they all went inside.")
	if(current_cycle == 33)
		M.say("; All of them wanted to be inside Andy's nice round ass.")
	if(current_cycle == 35)
		M.say("; Andy: 'No wait guys! My ass cannot hold this much! I'm getting so full!'")
	if(current_cycle == 37)
		M.say("; All the toys went inside of poor squirming Andy and pretty much, he was beyond full, and died from having his insides completely damaged.")
	if(current_cycle == 39)
		M.say("; The mother came inside and found Andy, dead with a huge ass hemorrhage on his anus, with a HUGE belly full of toys.")
		to_chat(M, "<span class='danger'> Thankfully, it's over.</span>")
	..()

//johnvris gusher : - )
/datum/reagent/gusherjackfruit
	name = "Joyful Johnvris Jackfruit Gusher Juice"
	id = "gusherjackfruit"
	description = "Oh Johnnnnn!"
	reagent_state = LIQUID
	color = "#D3D900"
	metabolization_rate = 0.625 * REAGENTS_METABOLISM
	taste_description = "bad fanfiction and jackfruit"

/datum/reagent/gusherjackfruit/on_mob_life(mob/living/M)
	M.adjustBruteLoss(-4*REM, 0)
	M.adjustFireLoss(-4*REM, 0)
	M.adjustOxyLoss(-4*REM, 0)
	M.adjustToxLoss(-4*REM, 0)
	. = 1
	if(current_cycle == 1)
		to_chat(M, "<span class='userdanger'>You suddenly lose control of what you're saying! Oh no...</span>")
	if(current_cycle == 3)
		M.say("; Vriska: Oh Johnnnnn!")
	if(current_cycle == 5)
		M.say("; John: Mm, yeah Vriska? What’s up?")
	if(current_cycle == 7)
		M.say("; Vriska: Not much. Just wondering how you’re doing.")
	if(current_cycle == 9)
		M.say("; John: Huh? Pretty good? I’m just sitting around with you? Did you expect a different answer?")
	if(current_cycle == 11)
		M.say("; Vriska: No, no, no, I meant in the pailing department.")
	if(current_cycle == 13)
		M.say("; John: Pailing?")
	if(current_cycle == 15)
		M.say("; Vriska: Oh come on. You know. Sex.")
	if(current_cycle == 17)
		M.say("; John: O-Oh. Right.")
	if(current_cycle == 19)
		M.say("; Vriska: So?")
	if(current_cycle == 21)
		M.say("; John: I don’t think that’s any of your business.")
	if(current_cycle == 23)
		M.say("; Vriska: Of course it’s my business! I’m always going to train you to be the best! In EVERY department.")
	if(current_cycle == 25)
		M.say("; John: Oh my god.")
	if(current_cycle == 27)
		M.say("; Vriska: Though, I’m going to assume you’ve been lacking in the sexual department?")
	if(current_cycle == 29)
		M.say("; John: What does it matter? It’s fine.")
	if(current_cycle == 31)
		M.say("; Vriska: No it’s not. I should be training you, teaching you how to please a woman.")
	if(current_cycle == 33)
		M.say("; John sighs.")
	if(current_cycle == 35)
		M.say("; Vriska: Unless you are, how do you humans put it, a homosexual?")
	if(current_cycle == 37)
		M.say("; John: NO!")
	if(current_cycle == 39)
		M.say("; Vriska: Well then, why don’t you let me help out. Just a bit. Seeing what works you up. I think you’re the type who likes hand to bulge contact as a work up.")
	if(current_cycle == 41)
		M.say("; John: Obviously, since I’m the only one who touches that.")
	if(current_cycle == 43)
		M.say("; Vriska: So your poor human bulge has been neglected?")
	if(current_cycle == 45)
		M.say("; John: Hey now, I never said tha- *zipper being unzipped* Whoa, Vriska, what are you doing?")
	if(current_cycle == 47)
		M.say("; Vriska: Relax, just checking out the goods, John. A treasure hunter always has to see what she’s working with.")
	if(current_cycle == 49)
		M.say("; John: Yeah but- ah..")
	if(current_cycle == 51)
		M.say("; Vriska: Wow, you humans are really sensitive. Cute.")
	if(current_cycle == 53)
		M.say("; John: You just gave it a squeeze! What else was I supposed to *soft groan*")
	if(current_cycle == 55)
		M.say("; Vriska: Also a way to shut you up. Alright. I’ll keep that in mind for later.")
	if(current_cycle == 57)
		M.say("; John: L..Later?")
	if(current_cycle == 59)
		M.say("; Vriska: Yep. Just you wait, my little winner, I’m going to make you go for the gold.")
	if(current_cycle == 61)
		M.say("; John: Fuck, why did you take your hand away..")
	if(current_cycle == 63)
		M.say("; Vriska: I told you, all that will come later.")
	if(current_cycle == 65)
		M.say("; John groans.")
	if(current_cycle == 67)
		M.say("; Vriska: *laughs* I guess I could give you a little sneak peek. Just a -little- *shuffling noises*")
	if(current_cycle == 69)
		M.say("; John: Whoa, what, wait, Vriska, you- ah! *his breathing speeds up slightly* Oh man.. *John is breathing with occasional whimpers and gasps*")
	if(current_cycle == 71)
		M.say("; John: Ow.. Vriska, watch your fangs..")
	if(current_cycle == 73)
		M.say("; Vriska: You, telling me what to do? Ha. John, just sit back, shut up and enjoy the ride. Unless you want this demonstration to end prematurely-")
	if(current_cycle == 75)
		M.say("; John: No..sorry..")
	if(current_cycle == 77)
		M.say("; Vriska: That’s a good boy.")
	if(current_cycle == 79)
		M.say("; John: *groans* Holy shit.")
	if(current_cycle == 81)
		M.say("; Vriska, triumphant sounding: And that’s that! Preview for the next encounter.")
	if(current_cycle == 83)
		M.say("; John: What.")
	if(current_cycle == 85)
		M.say("; Vriska: See you next time!")
	if(current_cycle == 87)
		M.say("; John: Oh goddamnit, come on! I was so close, Jesus fuck- *upset grumbling*")
		to_chat(M, "<span class='danger'> Thankfully, it's over.</span>")
	..()

/datum/reagent/gusherdate
	name = "Disco Date Epileptic Spasm Gusher Juice"
	id = "gusherdate"
	description = "turn any place into a space nightclub"
	reagent_state = LIQUID
	color = "#470100"
	metabolization_rate = INFINITY
	taste_description = "an 80's nightclub"

/datum/reagent/gusherdate/on_mob_life(mob/living/M)
	var/disco_loc = get_turf(M)
	new /obj/item/clothing/neck/stripedbluescarf(disco_loc)
	new /obj/item/clothing/under/color/rainbow(disco_loc)
	new /obj/item/clothing/head/bearpelt(disco_loc)
	new /turf/open/floor/light/colour_cycle/dancefloor_a(disco_loc)
	new /obj/machinery/disco(disco_loc)
	..()

//TaB
/datum/reagent/consumable/tab
	name = "TaB"
	id = "tab"
	description = "A diet soft drink, manufactured by the Coca-Cola company."
	color = "#602E00"
	taste_description = "saccharin"
	glass_name = "glass of TaB"
	glass_desc = "A glass of TaB."

//Faygo flavor(s)
/datum/reagent/consumable/faygoredpop
	name = "Red Pop Faygo"
	id = "faygoredpop"
	description = "A soft drink favored by juggalos."
	color = "#EA1010"
	taste_description = "strawberry soda"
	glass_name = "glass of red pop faygo"
	glass_desc = "A glass of Red Pop Faygo, favored by juggalos across the universe."

//Troll Mutation Toxin
/datum/reagent/stableslimetoxin/troll
	name = "Troll Mutation Toxin"
	id = "trollmutationtoxin"
	description = "A troll-ifying mutation toxin produced by slimes."
	color = "#B2B2B2" //RGB: 178, 178, 178
	race = /datum/species/troll
	mutationtext = "<span class='danger'>The pain subsides. You can feel a new pair of horns on your head.</span>"