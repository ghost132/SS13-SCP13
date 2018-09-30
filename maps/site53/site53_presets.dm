var/const/NETWORK_895			= "SCP-895 CCTV Network (CAUTION!)"
var/const/NETWORK_ENGINE		= "Engineering Network"
var/const/NETWORK_ENTRANCE		= "Entrance Zone Network"
var/const/NETWORK_173			= "SCP-173 CCTV Network"
var/const/NETWORK_012			= "SCP-012 CCTV Network"

/datum/map/site53/get_network_access(var/network)
	switch(network)
		if(NETWORK_895)
			return access_sciencelvl3
		if(NETWORK_ENGINEERING)
			return access_mtflvl1
		if(NETWORK_ENTRANCE)
			return access_mtflvl1
		if(NETWORK_173)
			return access_sciencelvl1
		if(NETWORK_012)
			return access_sciencelvl1
	return get_shared_network_access(network) || ..()

/datum/map/site53
	// Networks that will show up as options in the camera monitor program
	station_networks = list(
		NETWORK_895,
		NETWORK_ENGINE,
		NETWORK_ENTRANCE,
		NETWORK_173,
		NETWORK_012
	)

//
// Cameras
//

// Networks
/obj/machinery/camera/network/scp895
	network = list(NETWORK_895)

/obj/machinery/camera/network/scp173
	network = list(NETWORK_173)

/obj/machinery/camera/network/scp012
	network = list(NETWORK_012)

/obj/machinery/camera/network/engine
	network = list(NETWORK_ENGINE)

/obj/machinery/camera/network/entrance
	network = list(NETWORK_ENTRANCE)

// Substation SMES
/obj/machinery/power/smes/buildable/preset/ds90/substation/configure_and_install_coils()
	component_parts += new /obj/item/weapon/smes_coil(src)
	component_parts += new /obj/item/weapon/smes_coil(src)
	_input_maxed = TRUE
	_output_maxed = TRUE

// Substation SMES (charged and with full I/O setting)
/obj/machinery/power/smes/buildable/preset/ds90/substation_full/configure_and_install_coils()
	component_parts += new /obj/item/weapon/smes_coil(src)
	component_parts += new /obj/item/weapon/smes_coil(src)
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE
	_fully_charged = TRUE

// Main Engine output SMES
/obj/machinery/power/smes/buildable/preset/ds90/engine_main/configure_and_install_coils()
	component_parts += new /obj/item/weapon/smes_coil/super_io(src)
	component_parts += new /obj/item/weapon/smes_coil/super_io(src)
	component_parts += new /obj/item/weapon/smes_coil/super_capacity(src)
	component_parts += new /obj/item/weapon/smes_coil/super_capacity(src)
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE
	_fully_charged = TRUE

// Shuttle SMES
/obj/machinery/power/smes/buildable/preset/ds90/shuttle/configure_and_install_coils()
	component_parts += new /obj/item/weapon/smes_coil/super_io(src)
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE
	_fully_charged = TRUE

// Hangar SMES. Charges the shuttles so needs a pretty big throughput.
/obj/machinery/power/smes/buildable/preset/ds90/hangar/configure_and_install_coils()
	component_parts += new /obj/item/weapon/smes_coil/super_io(src)
	component_parts += new /obj/item/weapon/smes_coil/super_io(src)
	_input_maxed = TRUE
	_output_maxed = TRUE
	_input_on = TRUE
	_output_on = TRUE
	_fully_charged = TRUE

/datum/map/proc/get_shared_network_access(var/network)
	switch(network)
		if(NETWORK_ENGINE)
			return access_mtflvl1