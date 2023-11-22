##########################################################################################
# Telegram : @algorithmdev by Kreapic
##########################################################################################

SKIPMOUNT=true

PROPFILE=false

POSTFSDATA=false

LATESTARTSERVICE=true

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# Check the documentations for more info about how Magic Mount works, and why you need this

# This is an example
REPLACE="
/system/app/Youtube
/system/priv-app/SystemUI
/system/priv-app/Settings
/system/framework
"

# Construct your own list here, it will override the example above
# !DO NOT! remove this if you don't need to replace anything, leave it empty as it is now
REPLACE="
"
# Color 

grn="\e[92m"

##########################################################################################
# Installation Message
##########################################################################################

# Set what you want to show when installing your mod

print_modname() {
  ui_print "$grn▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒"
  ui_print " "
  ui_print "                  [Algorithm Dev x Kreapic]                    "
  sleep 1
  ui_print "          Disable GPU Thermal & Change GPU Governor            "
  sleep 1
  ui_print "                Telegram : @algorithmdev                       "
  ui_print "                      Version 1.0                              "
  sleep 1.5
  ui_print "          Note : Only For SNAPDRAGON Devices! DWYOR!           "
  ui_print " "
  ui_print "▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒"
}

on_install() {
  # The following is the default implementation: extract $ZIPFILE/system to $MODPATH
  # Extend/change the logic to whatever you want
  ui_print " "
  ui_print "▒▒▒▒ DEVICE INFORMATION ▒▒▒▒"
  ui_print " "
  ui_print "build release     [🕗]•$(getprop ro.build.date)			     "
  ui_print " "
  ui_print "device model      [📱]•$(getprop ro.product.model)		    "
  ui_print " "
  ui_print "device chipset    [📱]•$(getprop ro.hardware.chipname)		"
  ui_print " "
  sleep 2
  ui_print "▒▒▒▒ INSTALLATION ▒▒▒▒"
  ui_print " "
  ui_print "- Please wait..."
  sleep 1.5
  ui_print " Extracting module files "
  unzip -o "$ZIPFILE" 'script/*' -d $MODPATH >&2
  ui_print " "
  ui_print " Done "
}

##########################################################################################
# Permissions
##########################################################################################

set_permissions() {
  # Only some special files require specific permissions
  
  set_perm_recursive $MODPATH 0 0 0755 0644
  set_perm_recursive $MODPATH/script 0 0 0755 0700
}

# Done.

