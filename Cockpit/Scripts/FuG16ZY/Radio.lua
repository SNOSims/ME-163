dofile(LockOn_Options.common_script_path..'Radio.lua')
dofile(LockOn_Options.common_script_path.."mission_prepare.lua")

local gettext = require("i_18n")
_ = gettext.translate

device_timer_dt = 0.2

innerNoise 			= getInnerNoise(4E-6, 10)--V/m (dB S+N/N)
frequency_accuracy 	= 2000.0			--Hz
band_width			= 12E3				--Hz (6 dB selectivity)
power 				= 10.0				--Wt

agr = {
	input_signal_deviation		= rangeUtoDb(5E-6, 0.5), --Db
	output_signal_deviation		= 5,  --Db
	input_signal_linear_zone 	= 10.0, --Db
	regulation_time				= 0.25, --sec
}

presets = {}

presets[1] = 39000000.0 --134000000.0
presets[2] = 40000000.0 --133000000.0
presets[3] = 41000000.0 --132000000.0
presets[4] = 42000000.0 --131000000.0
presets[5] = 38000000.0 --131000000.0

GUI = {
	displayName = _('FuG16ZY'),
	AM = true,
	FM = false
}

ElecConsumerParams = {11.5, false, 19, 21}

VHF_CRYSTAL				= 0
VHF_SHORTED_CTL_BOX		= 1
VHF_VT_BURNED_OUT		= 2
VHF_SQUELCH_RELAY		= 3
AFN2_DAMAGE				= 4

Damage = {
{Failure = VHF_CRYSTAL, Failure_name = "VHF_CRYSTAL", Failure_editor_name = _("Radio. Crystal or tube failure"),  Element = 3, Integrity_Treshold = 0.3, work_time_to_fail_probability = 0.5, work_time_to_fail = 3600*300},
{Failure = VHF_SHORTED_CTL_BOX, Failure_name = "VHF_SHORTED_CTL_BOX", Failure_editor_name = _("Radio. Shorted control box"),  Element = -1, Integrity_Treshold = 0.0, work_time_to_fail_probability = 0.5, work_time_to_fail = 3600*300},
{Failure = VHF_VT_BURNED_OUT, Failure_name = "VHF_VT_BURNED_OUT", Failure_editor_name = _("Radio. Receiver burned out"),  Element = -1, Integrity_Treshold = 0.0, work_time_to_fail_probability = 0.5, work_time_to_fail = 3600*300},
{Failure = VHF_SQUELCH_RELAY, Failure_name = "VHF_SQUELCH_RELAY", Failure_editor_name = _("Radio. Squelch relay not working"),  Element = -1, Integrity_Treshold = 0.0, work_time_to_fail_probability = 0.5, work_time_to_fail = 3600*300},
{Failure = AFN_DAMAGE,        Failure_name = "AFN2_DAMAGE", Failure_editor_name = _("Radio. AFN2 not working"),  Element = -1, Integrity_Treshold = 0.0, work_time_to_fail_probability = 0.5, work_time_to_fail = 3600*300},
}

local steeringBarsT1 = 0.15 
local deviation_max = 1.0 -- math.rad(5.0)

course_deviation = {isLagElement = true, valmin = -deviation_max, valmax = deviation_max, T1 = 0.3, 
bias = {{valmin = -deviation_max, valmax = deviation_max, bias = 0.001}}}

signal_strength = {isLagElement = true, valmin = 0.0, valmax = 1, T1 = 0.15, bias = {{valmin = 0.0, valmax = 1, bias = 0.01}}}

AFN_Frequency = {base_frequency = 111500000.0}  -- AFN_Frequency = {base_frequency = 38000000.0} -- Real History Frequency

need_to_be_closed = true -- close lua state after initialization
