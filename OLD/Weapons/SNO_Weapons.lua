-- Setting up model container
mount_vfs_model_path(current_mod_path .. "/SNO_Weapons/Shapes")
-- end of Setting up model container



-- Defining ammunition



    local tracer_on_time = 0.01
    local barrel_smoke_level = 1.0
    local barrel_smoke_opacity = 0.1

    -- MK 108
    -- [1] = 3 cm M-Gesch. Patr. 108 m. Zerl Ausf. A
    declare_weapon({category = CAT_SHELLS, name = "SNO_MK_108_MGsch", user_name = _("SNO_MK_108_MGsch"),
        model_name      = "tracer_bullet_yellow",
        mass            = 0.330, -- Bullet mass
        round_mass      = 0.470 + 0.110, -- Assembled shell + link
        cartridge_mass  = 0.125 + 0.110, -- Empty shell (+ link if links are stored as well)
        explosive       = 0.1275,
        v0              = 500.0,
        Dv0             = 0.008,
        Da0             = 0.0004,
        Da1             = 0.0,
        life_time       = 4.0,
        caliber         = 30,
        s               = 0.0,
        j               = 0.0,
        l               = 0.0,
        charTime        = 0,
        cx              = {1.5, 0.99, 0.36, 0.55, 1.8},
        k1              = 4.9e-08,
        tracer_off      = -1,
        tracer_on       = tracer_on_time,
        smoke_tail_life_time = 0,
        scale_tracer    = 0,
        cartridge       = 0,
        scale_smoke     = barrel_smoke_level,
        smoke_opacity   = barrel_smoke_opacity,
    })

    -- [2] = 3 cm M-Gesch. Patr. L.Spur 108 m. Zerl
    declare_weapon({category = CAT_SHELLS, name = "SNO_MK_108_MGsch_T", user_name = _("SNO_MK_108_MGsch_T"),
        model_name      = "tracer_bullet_yellow",
        mass            = 0.330, -- Bullet mass
        round_mass      = 0.470 + 0.110, -- Assembled shell + link
        cartridge_mass  = 0.125 + 0.110, -- Empty shell (+ link if links are stored as well)
        explosive       = 0.1275,
        v0              = 500.0,
        Dv0             = 0.008,
        Da0             = 0.0004,
        Da1             = 0.0,
        life_time       = 4.0,
        caliber         = 30,
        s               = 0.0,
        j               = 0.0,
        l               = 0.0,
        charTime        = 0,
        cx              = {1.0, 0.5, 0.66, 0.25, 1.7},
        k1              = 2.2e-08,
        tracer_off      = 2.7,
        tracer_on       = tracer_on_time,
        smoke_tail_life_time = 2.7,
        scale_tracer    = 1,
        cartridge       = 0,
        scale_smoke     = barrel_smoke_level,
        smoke_opacity   = barrel_smoke_opacity,
    })

    -- [3] = 3 cm Brgr. Patr. 108 m. Zerl
    declare_weapon({category = CAT_SHELLS, name = "SNO_MK_108_HEI", user_name = _("SNO_MK_108_HEI"),
        model_name      = "tracer_bullet_yellow",
        mass            = 0.370, -- Bullet mass
        round_mass      = 0.470 + 0.110, -- Assembled shell + link
        cartridge_mass  = 0.125 + 0.110, -- Empty shell (+ link if links are stored as well)
        explosive       = 0.0360,
        v0              = 485.0,
        Dv0             = 0.008, -- медиан относительного разброса скорости - [v0-V0*Dv0, v0+v0*Dv0] содержит 50% скоростей
        Da0             = 0.0004,
        Da1             = 0.0,
        life_time       = 4.0,
        caliber         = 30,
        s               = 0.0,
        j               = 0.0,
        l               = 0.0,
        charTime        = 0,
        cx              = {1.2, 0.72, 0.6, 0.62, 1.4},
        k1              = 4.8e-08,
        tracer_off      = -1,
        tracer_on       = tracer_on_time,
        smoke_tail_life_time = 0,
        scale_tracer    = 0,
        cartridge       = 0,
        scale_smoke     = barrel_smoke_level,
        smoke_opacity   = barrel_smoke_opacity,
    })
    -- end of MK 108

-- end of Defining ammunition

-- Defining guns
    -- MK 108
    function SNO_MK_108 ( tbl )
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
    -- end of MK 108
-- end of Defining guns

