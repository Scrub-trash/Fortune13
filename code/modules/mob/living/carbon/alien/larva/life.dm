

/mob/living/carbon/alien/larva/Life()
	set invisibility = 0
	if (notransform)
		return
	if(..()) //not dead
		// GROW!
		if(amount_grown < max_grown)
			amount_grown++
			update_icons()


/mob/living/carbon/alien/larva/update_stat()
	if(status_flags & GODMODE)
		return
	if(stat != DEAD)
		if(health<= -maxHealth || !getorgan(/obj/item/organ/brain))
			death()
			return
		if(_REFACTORING_IsUnconscious() || _REFACTORING_IsSleeping() || getOxyLoss() > 50 || (HAS_TRAIT(src, TRAIT_DEATHCOMA)) || health <= crit_threshold)
			if(stat == CONSCIOUS)
				stat = UNCONSCIOUS
				blind_eyes(1)
				update_mobility()
		else
			if(stat == UNCONSCIOUS)
				stat = CONSCIOUS
				if(!recoveringstam)
					resting = 0
				adjust_blindness(-1)
				update_mobility()
	update_damage_hud()
	update_health_hud()
