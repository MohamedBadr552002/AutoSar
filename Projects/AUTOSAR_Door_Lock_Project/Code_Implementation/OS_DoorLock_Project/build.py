#! /usr/bin/env python3
# -*- coding: UTF-8 -*-
#----------------------------------------------------------------------
#--- Python Build file for application timer
#--- automatically generated by goil on Www Mmm dd hh:mm:ss yyyy
#--- from root OIL file LearnInDepth_SW.oil
#---
#--- Compiling a Trampoline application is done in 2 stages
#--- 1 - From the OIL file, a set of files is generated as long as
#---     build options. Among these files are the build.py and make.py
#---     files. make.py contains compilation rules when the OIL file
#---     and the included OIL files are modified. make.py is only
#---     written once when the goil command is typed.
#--- 2 - From all the C/assembly files (OS, Application, librairies,
#---     configuration, ...), the objects and the executable are
#---     produced. This is done by the build.py file.
#---     build.py is generated each time goil is called by make.py
#----------------------------------------------------------------------

import sys, os, subprocess, string
from string import Template

#--- Add some function for Python3 support

if sys.version_info[0] >=3 :
    def bytesdecode(obj) :
        return obj.decode(sys.stdout.encoding)
else :
    def bytesdecode(obj) :
        return obj

#--- Add the location of makefile.py to the import path
sys.path.append("../../../make")

#--- Import the makefile system in python
import makefile, projfile

#--- To work with relative paths
scriptDir = os.path.dirname (os.path.abspath (sys.argv[0]))
os.chdir (scriptDir)

#--- Get goal as first argument
askedGoal = "all"
if len (sys.argv) > 1 :
  askedGoal = sys.argv [1]

if askedGoal == "all" or askedGoal == "clean" :
  goal = askedGoal
else :
  goal = "all"

#--- Get max parallel jobs as second argument
maxParallelJobs = 0 # 0 means use host processor count
if len (sys.argv) > 2 :
  maxParallelJobs = int (sys.argv [2])

#--- Instanciate a new makefile object
make = makefile.Make(goal)

#----------------------------------------------------------------------
#--- Various variables used after
#----------------------------------------------------------------------
compiler = r"arm-none-eabi-gcc"
cppCompiler = r"g++"
linker = r"arm-none-eabi-ld"
assembler = r"arm-none-eabi-as"
autosar = False
autosar_sc = 0
autosar_osapplications = False
with_ioc = False
with_com = False
scheduler = "osek"
trampoline_base_path = "../../../"
cflags = []
cppflags = []
ldflags = []
asflags = []
# flags that should appear at the beginning of the command.
precflags = []
precppflags = []
preldflags = []
preasflags = []
includeDirs = []

cflags += "--specs=nosys.specs".split()
cflags += "-O0 -g ".split()
cppflags += "-fno-rtti".split()
cppflags += "-felide-constructors".split()
cppflags += "-fno-threadsafe-statics".split()
cppflags += "-fno-use-cxa-get-exception-ptr".split()
cppflags += "-fno-enforce-eh-specs".split()
cflags += "-g".split()
cppflags += "-g".split()
cflags += "-Wno-unused-but-set-variable".split()
cppflags += "-Wno-unused-but-set-variable".split()
cflags += "-Wmissing-field-initializers".split()
cppflags += "-Wmissing-field-initializers".split()
cflags += "-mcpu=cortex-m4".split()
cppflags += "-mcpu=cortex-m4".split()
cflags += "-mthumb".split()
cppflags += "-mthumb".split()
cflags += "-mfloat-abi=soft".split()
cppflags += "-mfloat-abi=soft".split()
cflags += "-mfpu=fpv4-sp-d16".split()
cppflags += "-mfpu=fpv4-sp-d16".split()
cflags += "-nostartfiles".split()
cppflags += "-nostartfiles".split()
cflags += "-fno-builtin".split()
cppflags += "-fno-builtin".split()
cflags += "-fno-exceptions".split()
cppflags += "-fno-exceptions".split()
cflags += "-nostdlib".split()
cppflags += "-nostdlib".split()
cflags += "-ffunction-sections".split()
cppflags += "-ffunction-sections".split()
cflags += "-fdata-sections".split()
cppflags += "-fdata-sections".split()
includeDirs += ["-I","../../../machines/cortex-m"]
includeDirs += ["-I","../../../machines/cortex-m/CMSIS/Include"]
includeDirs += ["-I","../../../machines/cortex-m/armv7em"]
includeDirs += ["-I","../../../machines/cortex-m/armv7em/stm32f407"]
includeDirs += ["-I","../../../machines/cortex-m/armv7em/stm32f407/lib"]
includeDirs += ["-I","../../../machines/cortex-m/armv7em/stm32f407/CMSIS-ST/Device/ST/STM32F4xx/Include"]
includeDirs += ["-I","../../../machines/cortex-m/armv7em/stm32f407/STM32F4xx_StdPeriph_Driver"]
includeDirs += ["-I","../../../machines/cortex-m/armv7em/stm32f407/STM32F4xx_StdPeriph_Driver"]
includeDirs += ["-I","../../../machines/cortex-m/armv7em/stm32f407/stm32f4discovery"]
if with_ioc:
  includeDirs += ["-I", "../../../ioc"]
includeDirs += ["-I", "../../../com"]
includeDirs += ["-I", "../../../os"]
includeDirs += ["-I", "../../../debug"]
includeDirs += ["-I", "LearnInDepth_SW"]
cflags   += includeDirs
cppflags += includeDirs
asflags  += includeDirs

ldflags += "--fatal-warnings".split()
ldflags += "--warn-common".split()
ldflags += "--no-undefined".split()
ldflags += "--gc-sections".split()
ldflags += "-Map=LearnInDepth_SW.map".split()
ldflags += ["-L", "LearnInDepth_SW"]
ldflags += ["-T", "script.ld"]
asflags += "-g".split()
asflags += "-Wall".split()
asflags += "-mcpu=cortex-m4".split()
asflags += "-mthumb".split()
asflags += "--fatal-warnings".split()
asflags += "-mfloat-abi=soft".split()
asflags += "-mfpu=fpv4-sp-d16".split()

#----------------------------------------------------------------------
#--- Try to detect automatically the location of libc and libgcc
#--- This supposes the compiler has a (something)-gcc name
#--- for non posix target
#----------------------------------------------------------------------
if "gcc" in compiler:
  compilerFullPath = makefile.find_executable(compiler)
  if compilerFullPath != None:
    #--- Extract the (something) from the compiler executable name
    compilerParts = compiler.split('-')
    compilerParts.pop()
    compilerPrefix = "-".join(compilerParts)
    #--- Get the full path of the compiler
    compilerToolChainPath = os.path.dirname(os.path.dirname(compilerFullPath))
    #--- Get the version of the compiler, [:-1] removes the carriage return
    compilerVersion = subprocess.check_output([compiler, '-dumpversion'])[:-1]
    #--- Build the libc and libgcc paths
    procLibc  =subprocess.Popen([compilerFullPath,"-print-file-name=libc.a"]+cflags,stdout=subprocess.PIPE)
    procLibgcc=subprocess.Popen([compilerFullPath,"-print-libgcc-file-name"]+cflags,stdout=subprocess.PIPE)
    procLibc.wait()
    procLibgcc.wait()
    libcPath = os.path.dirname(procLibc.stdout.readline().strip())
    libgccPath = os.path.dirname(procLibgcc.stdout.readline().strip())
    #--- Add both to linker flags
    ldflags += ['-L' + bytesdecode(libcPath), '-lc']
    ldflags += ['-L' + bytesdecode(libgccPath), '-lgcc']

#----------------------------------------------------------------------
#--- Build the source files list
#----------------------------------------------------------------------
cSourceList = []
cppSourceList = []
sSourceList = []
oilSourceList = []

#--- OIL file
oilSourceList.append("LearnInDepth_SW.oil")

#--- Kernel files 
cSourceList.append(projfile.ProjectFile("os/tpl_os_kernel.c", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("os/tpl_os_timeobj_kernel.c", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("os/tpl_os_action.c", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("os/tpl_os_error.c", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("os/tpl_os_os_kernel.c", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("os/tpl_os_os.c", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("os/tpl_os_interrupt_kernel.c", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("os/tpl_os_task_kernel.c", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("os/tpl_os_resource_kernel.c", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("os/tpl_os_event_kernel.c", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("os/tpl_os_alarm_kernel.c", trampoline_base_path))

#--- Add C files of the application
cSourceList.append(projfile.ProjectFile("LearnInDepth_SW.c"))
cSourceList.append(projfile.ProjectFile("./AUTOSAR_implementation/DoorLockIndication_SWC.c"))
cSourceList.append(projfile.ProjectFile("./AUTOSAR_implementation/DoorSensorAbstraction.c"))
cSourceList.append(projfile.ProjectFile("./AUTOSAR_implementation/RTE_Generated_Files/Rte_DoorLockIndication_SWC.c"))
cSourceList.append(projfile.ProjectFile("./AUTOSAR_implementation/RTE_Generated_Files/Rte_DoorSensorAbstraction.c"))
cSourceList.append(projfile.ProjectFile("./AUTOSAR_implementation/MCAL/DIO.c"))

#--- Add generated files
cSourceList.append(projfile.ProjectFile("LearnInDepth_SW/tpl_app_config.c"))

cSourceList.append(projfile.ProjectFile("LearnInDepth_SW/tpl_dispatch_table.c"))
cSourceList.append(projfile.ProjectFile("LearnInDepth_SW/tpl_invoque.S"))
cSourceList.append(projfile.ProjectFile("LearnInDepth_SW/tpl_primary_irq.S"))
cSourceList.append(projfile.ProjectFile("LearnInDepth_SW/tpl_vectors.c"))
cSourceList.append(projfile.ProjectFile("LearnInDepth_SW/tpl_external_interrupts.c"))
cSourceList.append(projfile.ProjectFile("LearnInDepth_SW/tpl_app_interrupts.c"))
cSourceList.append(projfile.ProjectFile("machines/cortex-m/tpl_machine_cortex.c", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("machines/cortex-m/tpl_sc_handler.S", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("machines/cortex-m/tpl_startup.S", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("machines/cortex-m/armv7em/tpl_ctx_switch.S", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("machines/cortex-m/armv7em/tpl_ctx_switch_under_it.S", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("machines/cortex-m/armv7em/tpl_interrupts.S", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("machines/cortex-m/armv7em/stm32f407/tpl_memory_protection.c", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("machines/cortex-m/armv7em/stm32f407/tpl_machine_stm32f407.c", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("machines/cortex-m/armv7em/stm32f407/startup_stm32f4xx.c", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("machines/cortex-m/armv7em/stm32f407/system_stm32f4xx.c", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("machines/cortex-m/armv7em/stm32f407/handlers_stm32f4xx.c", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("machines/cortex-m/armv7em/stm32f407/lib/pinAccess.c", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("machines/cortex-m/armv7em/stm32f407/STM32F4xx_StdPeriph_Driver/stm32f4xx_gpio.c", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("machines/cortex-m/armv7em/stm32f407/STM32F4xx_StdPeriph_Driver/stm32f4xx_rcc.c", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("machines/cortex-m/armv7em/stm32f407/STM32F4xx_StdPeriph_Driver/stm32f4xx_exti.c", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("machines/cortex-m/armv7em/stm32f407/STM32F4xx_StdPeriph_Driver/stm32f4xx_syscfg.c", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("machines/cortex-m/armv7em/stm32f407/STM32F4xx_StdPeriph_Driver/misc.c", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("machines/cortex-m/armv7em/stm32f407/stm32f4discovery/stm32f4_discovery.c", trampoline_base_path))
cSourceList.append(projfile.ProjectFile("machines/cortex-m/armv7em/stm32f407/stm32f4discovery/tp.c", trampoline_base_path))
#----------------------------------------------------------------------
#--- Build the object list and the compiler dependancies
#----------------------------------------------------------------------
objectList = []

for sourceFile in cSourceList:
  source = sourceFile.src()
  object = sourceFile.obj("build")
  depObject = sourceFile.dep("build")
  objectList.append(object)
  rule = makefile.Rule([object], "Compiling " + source)
  rule.deleteTargetDirectoryOnClean()
  rule.mDependences.append(source)
  rule.mCommand.append(compiler)
  rule.mCommand += precflags
  rule.mCommand += ["-c", source]
  rule.mCommand += ["-o", object]
  rule.mCommand += ["-MD", "-MP", "-MF", depObject]
  rule.mCommand += cflags
  rule.enterSecondaryDependanceFile (depObject, make)
  make.addRule(rule)

for sourceFile in cppSourceList:
  source = sourceFile.src()
  object = sourceFile.obj("build")
  depObject = sourceFile.dep("build")
  objectList.append(object)
  rule = makefile.Rule([object], "Compiling " + source)
  rule.deleteTargetDirectoryOnClean()
  rule.mDependences.append(source)
  rule.mCommand.append(cppCompiler)
  rule.mCommand += precppflags
  rule.mCommand += ["-c", source]
  rule.mCommand += ["-o", object]
  rule.mCommand += ["-MD", "-MP", "-MF", depObject]
  rule.mCommand += cppflags
  rule.enterSecondaryDependanceFile (depObject, make)
  make.addRule(rule)

for sourceFile in sSourceList:
  source = sourceFile.src()
  object = sourceFile.obj("build")
  objectList.append(object)
  rule = makefile.Rule([object], "Assembling " + source)
  rule.mDependences.append(source)
  rule.mCommand.append(assembler)
  rule.mCommand += preasflags
  rule.mCommand += ["-c", source]
  rule.mCommand += ["-o", object]
  rule.mCommand += asflags
  make.addRule(rule)

product = "LearnInDepth_SW.axf"
rule = makefile.Rule ([product], "Linking " + product)
rule.deleteTargetFileOnClean()
rule.mDeleteTargetOnError = True
rule.mDependences += objectList
rule.mCommand += [linker]
rule.mCommand += ["-o", product]
rule.mCommand += preldflags
rule.mCommand += objectList
rule.mCommand += ldflags
if True:
  postCommand = makefile.PostCommand("Generating binary LearnInDepth_SW.axf.bin from LearnInDepth_SW.axf")
  postCommand.mCommand.append(r"arm-none-eabi-objcopy")
  postCommand.mCommand += "-O binary".split()
  postCommand.mCommand.append("LearnInDepth_SW.axf")
  postCommand.mCommand.append("LearnInDepth_SW.axf.bin")
  rule.mPostCommands.append(postCommand)

make.addRule (rule)

make.addGoal("all", [product], "Building all")
make.addGoal("compile", objectList, "Compile source files")


make.runGoal(maxParallelJobs, maxParallelJobs == 1)

postVariableMapping = dict(
  MACHINE_PATH='../../../machines',
  ARCH_PATH='../../../machines/cortex-m',
  BOARD_PATH='../../../machines/cortex-m/armv7em/stm32f407/stm32f4discovery',
  TARGET='cortex-m/armv7em/stm32f407/stm32f4discovery'
)


#----------------------------------------------------------------------
#--- post commands
#----------------------------------------------------------------------
if make.errorCount() == 0:
  if askedGoal == "burn" :
    commandLine = "st-flash write "
    commandLine += "LearnInDepth_SW.axf.bin "
    commandLine += "0x8000000 "
    commandLineTemplate = Template(commandLine)
    commandLine = commandLineTemplate.safe_substitute(postVariableMapping)
    if makefile.find_executable("st-flash") != None:
      print("\033[1m\033[95mFlashing LearnInDepth_SW.axf on cortex-m/armv7em/stm32f407/stm32f4discovery\033[0m")
      subprocess.call(commandLine, shell=True)
    else:
      print("Command 'st-flash' not in PATH")


make.printErrorCountAndExitOnError()

#----------------------------------------------------------------------
#-- End of build.py
#----------------------------------------------------------------------
