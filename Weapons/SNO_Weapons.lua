---Guns------
local function SNO_MK_108 ( tbl )
        tbl.category = CAT_GUN_MOUNT
        tbl.name = "SNO_MK_108"
        tbl.supply = {
            shells = {"SNO_MK_108_MGsch", "SNO_MK_108_MGsch_T", "SNO_MK_108_HEI"},
            mixes = {{2, 2}},
            count = 60,
        }
        if tbl.mixes then
            tbl.supply.mixes = tbl.mixes
            tbl.mixes        = nil
        end
        if tbl.count then
            tbl.supply.count = tbl.count
            tbl.count = nil
        end
        tbl.gun = {
            max_burst_length = 65535,
            rates = {660}, -- unsynchronized mount
            recoil_coeff = 1.0,
            barrels_count = 1,
        }
        if tbl.rates then
            tbl.gun.rates = tbl.rates
            tbl.rates = nil
        end
        tbl.ejector_pos = tbl.ejector_pos or {0.0, 0.05, 0.0}
        tbl.ejector_dir = {0, -1, 0}
        --tbl.effect_arg_number = tbl.effect_arg_number or 436
        tbl.supply_position = tbl.supply_position or {0, -0.3, -1.5}
        tbl.aft_gun_mount = false
        tbl.effective_fire_distance = 1000
        --tbl.drop_cartridge = 0 -- 204
        tbl.muzzle_pos = {0, 0, 0} -- all position from connector
        tbl.azimuth_initial = tbl.azimuth_initial or 0
        tbl.elevation_initial = tbl.elevation_initial or 0

        return declare_weapon(tbl)
    end
--------------------------------------------------------------------------------