RM-2.27-Method-Crash
====================

Showcases bug introduced in RM 2.27 when using `&amp;method(:method_name)` to pass a proc to another method

To reproduce:

```
bundle
rake
```

Tap anywhere on the huge white view, notice that the app will crash.

Example Report

```
Process:         false_self [83660]
Path:            /Users/USER/Library/Application Support/iPhone Simulator/*/false_self.app/false_self
Identifier:      false_self
Version:         0
Code Type:       X86 (Native)
Parent Process:  launchd_sim [79536]
Responsible:     launchd_sim [79536]
User ID:         501

Date/Time:       2014-05-07 08:46:36.404 -0400
OS Version:      Mac OS X 10.9.2 (13C1021)
Report Version:  11
Anonymous UUID:  5E9A4DB5-9331-CC52-5BC5-BA27B1D1C9DF

Sleep/Wake UUID: A94A9990-84F9-4B19-B7C6-62FF04134BF0

Crashed Thread:  0  Dispatch queue: com.apple.main-thread

Exception Type:  EXC_BAD_ACCESS (SIGSEGV)
Exception Codes: KERN_INVALID_ADDRESS at 0x0000000060000000

VM Regions Near 0x60000000:
    VM_ALLOCATE            000000000feba000-000000000ff3a000 [  512K] rwx/rwx SM=PRV  
--> 
    __TEXT                 000000008fef2000-000000008ff25000 [  204K] r-x/rwx SM=COW  /usr/lib/dyld

Application Specific Information:
iPhone Simulator 463.9.41, iPhone OS 7.1 (iPhone Retina (4-inch)/11D167)
 

Thread 0 Crashed:: Dispatch queue: com.apple.main-thread
0   libobjc.A.dylib               	0x004820e6 lookUpImpOrForward + 59
1   libobjc.A.dylib               	0x00481fdd class_getInstanceMethod + 78
2   false_self                    	0x002dcf39 rb_vm_dispatch + 969
3   false_self                    	0x002df422 vm_block_eval(RoxorVM*, rb_vm_block*, objc_selector*, unsigned long, int, unsigned long const*) + 578
4   false_self                    	0x002df1b8 rb_vm_block_eval + 104
5   false_self                    	0x002121bf proc_call + 31
6   false_self                    	0x002ddca7 rb_vm_dispatch + 4407
7   false_self                    	0x0014137c vm_dispatch + 1100
8   false_self                    	0x0014ab1e rb_scope__handle_gesture:__ + 174 (ui_view_wrapper.rb:45)
9   false_self                    	0x0014ab6d __unnamed_36 + 61
10  UIKit                         	0x012754f4 _UIGestureRecognizerSendActions + 230
11  UIKit                         	0x01274168 -[UIGestureRecognizer _updateGestureWithEvent:buttonEvent:] + 383
12  UIKit                         	0x01275bdd -[UIGestureRecognizer _delayedUpdateGesture] + 60
13  UIKit                         	0x0127913d ___UIGestureRecognizerUpdate_block_invoke + 57
14  UIKit                         	0x012790be _UIGestureRecognizerRemoveObjectsFromArrayAndApplyBlocks + 317
15  UIKit                         	0x0126f7ac _UIGestureRecognizerUpdate + 199
16  UIKit                         	0x00f1aa5a -[UIWindow _sendGesturesForEvent:] + 1291
17  UIKit                         	0x00f1b971 -[UIWindow sendEvent:] + 1021
18  UIKit                         	0x00eed5f2 -[UIApplication sendEvent:] + 242
19  UIKit                         	0x00ed7353 _UIApplicationHandleEventQueue + 11455
20  CoreFoundation                	0x01dfe77f __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE0_PERFORM_FUNCTION__ + 15
21  CoreFoundation                	0x01dfe10b __CFRunLoopDoSources0 + 235
22  CoreFoundation                	0x01e1b1ae __CFRunLoopRun + 910
23  CoreFoundation                	0x01e1a9d3 CFRunLoopRunSpecific + 467
24  CoreFoundation                	0x01e1a7eb CFRunLoopRunInMode + 123
25  GraphicsServices              	0x043fd5ee GSEventRunModal + 192
26  GraphicsServices              	0x043fd42b GSEventRun + 104
27  UIKit                         	0x00ed9f9b UIApplicationMain + 1225
28  false_self                    	0x000036bc main + 156 (main.mm:15)
29  libdyld.dylib                 	0x03365701 start + 1

Thread 1:: Dispatch queue: com.apple.libdispatch-manager
0   libsystem_kernel.dylib        	0x0349c992 kevent64 + 10
1   libdispatch.dylib             	0x03121f36 _dispatch_mgr_invoke + 238
2   libdispatch.dylib             	0x03121c72 _dispatch_mgr_thread + 60

Thread 2:
0   libsystem_kernel.dylib        	0x0349c046 __workq_kernreturn + 10
1   libsystem_pthread.dylib       	0x0345fdcf _pthread_wqthread + 372
2   libsystem_pthread.dylib       	0x03463cce start_wqthread + 30

Thread 3:
0   libsystem_kernel.dylib        	0x0349ba26 __recvfrom + 10
1   libsystem_sim_c.dylib         	0x031eb3f1 recv + 54
2   false_self                    	0x0031eb67 -[RMREPL receiveString] + 87
3   false_self                    	0x0031ed4c -[RMREPL start] + 204
4   Foundation                    	0x00b1ea07 -[NSThread main] + 76
5   Foundation                    	0x00b1e966 __NSThread__main__ + 1275
6   libsystem_pthread.dylib       	0x0345e5fb _pthread_body + 144
7   libsystem_pthread.dylib       	0x0345e485 _pthread_start + 130
8   libsystem_pthread.dylib       	0x03463cf2 thread_start + 34

Thread 0 crashed with X86 Thread State (32-bit):
  eax: 0x60000000  ebx: 0x00000000  ecx: 0x00000000  edx: 0x0975c11d
  edi: 0x0933207c  esi: 0x0975c11d  ebp: 0xbfffa6c8  esp: 0xbfffa6a0
   ss: 0x00000023  efl: 0x00010206  eip: 0x004820e6   cs: 0x0000001b
   ds: 0x00000023   es: 0x00000023   fs: 0x00000000   gs: 0x0000000f
  cr2: 0x60000000
  
Logical CPU:     0
Error Code:      0x00000004
Trap Number:     14


Binary Images:
    0x1000 -   0x35eff7 +false_self (0) <E6A35990-2F7D-3DC6-B54F-2E5CD23198DA> /Users/USER/Library/Application Support/iPhone Simulator/*/false_self.app/false_self
  0x475000 -   0x61ded7 +libobjc.A.dylib (627.6) <8FB21547-B475-3D3E-9C64-1EEF47A0FD18> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/libobjc.A.dylib
  0x63c000 -   0x7fcff7 +libicucore.A.dylib (511.23.6) <D7654AB6-5367-387D-8D3F-9A98C1F67A27> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/libicucore.A.dylib
  0x88f000 -   0xa40ff7  com.apple.CoreGraphics (1.600.0 - 580.4) <BB37EE91-2CCB-3AF1-BD1B-949974480AD7> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/CoreGraphics.framework/CoreGraphics
  0xa9c000 -   0xd5cff3 +Foundation (1047.25) <AA863261-99C5-3FBF-92D2-7C969B9E724E> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/Foundation.framework/Foundation
  0xec2000 -  0x1908ffb +UIKit (2935.137) <F80B566D-0B5D-33CF-BD54-8A5BBB8022AD> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/UIKit.framework/UIKit
 0x1dee000 -  0x1fa9ff7 +CoreFoundation (847.24) <A593E245-286E-3AD6-BBDE-97FB1BF53426> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/CoreFoundation.framework/CoreFoundation
 0x20c5000 -  0x20c5ffd +Accelerate (459) <BC17AB8C-5BCE-363E-8DEE-52885C962F0D> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/Accelerate.framework/Accelerate
 0x20c9000 -  0x2164ff7 +MobileCoreServices (51) <FF168230-B6D9-3A23-94C7-86C0A67F712B> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices
 0x21a5000 -  0x2370ff7 +CFNetwork (672.1.13) <AB5891BE-7FF2-3C08-B4B8-82D25EA70289> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/CFNetwork.framework/CFNetwork
 0x2457000 -  0x24b0ffb +SystemConfiguration (615.1) <30F31049-6B6B-3AEA-B948-F20BCA882F7C> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/SystemConfiguration.framework/SystemConfiguration
 0x24d9000 -  0x2540ffb +Security (1565.20) <FDE60566-B214-341C-8096-B7F4035823CE> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/Security.framework/Security
 0x2573000 -  0x2586ff7 +CoreVideo (117.0.2) <E4D9A42A-4399-31A3-960A-1C6C80973277> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/CoreVideo.framework/CoreVideo
 0x2596000 -  0x25a5ffb +OpenGLES (9.4.3) <F7650091-3241-3596-909C-EC3D5E666B14> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/OpenGLES.framework/OpenGLES
 0x25b0000 -  0x26e1ff3 +CoreImage (233.4) <425C4A06-952D-34F1-9F49-11447659FB1D> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/CoreImage.framework/CoreImage
 0x2755000 -  0x2a09ffb +ImageIO (957) <6D84D12E-5BE4-3514-951F-8AE5B1999E2C> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/ImageIO.framework/ImageIO
 0x2a8e000 -  0x2c22ff7 +QuartzCore (330.1.25) <EFEBB3A4-9C4D-31D0-A22E-9FECDBA00F7E> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/QuartzCore.framework/QuartzCore
 0x2cc0000 -  0x2dccffb +CoreText (390.10) <739FE99C-53B1-3767-A02C-4E7118F359F1> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/CoreText.framework/CoreText
 0x2e34000 -  0x2e95ff7 +CoreMedia (1329.160) <BA2093C9-9C05-35E1-A00A-2E47929A3674> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/CoreMedia.framework/CoreMedia
 0x2ed1000 -  0x2f2cff3 +CoreAudio (90.2.5) <FDBBD372-A183-33F4-BF59-F9D13C7572D2> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/CoreAudio.framework/CoreAudio
 0x2f4e000 -  0x2fb4ff7 +libc++.1.dylib (230) <4A4D0260-22BD-340B-A60E-6CF67582F10F> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/libc++.1.dylib
 0x3004000 -  0x3025fff +libSystem.dylib (111.10.5) <19EA26D9-875D-3179-B1F1-66D1D12CBB12> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/libSystem.dylib
 0x303c000 -  0x3060fff +libc++abi.dylib (114) <BBE91325-8091-3744-8FCD-58499F8B5D55> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/libc++abi.dylib
 0x306c000 -  0x3071fff +libsystem_override.dylib (111.10.5) <1FA1122D-2C29-3F06-973E-41E376F911FC> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/system/libsystem_override.dylib
 0x3077000 -  0x307cfff +libcache_sim.dylib (65) <4F98980D-EA09-3465-97A2-28F61D7A2FD3> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/system/libcache_sim.dylib
 0x3081000 -  0x308eff3 +libcommonCrypto_sim.dylib (60049) <688BFF67-1F7C-38A1-8669-190828FEAC09> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/system/libcommonCrypto_sim.dylib
 0x309a000 -  0x30efff7 +libcorecrypto_sim.dylib (170.2) <B1A240B4-AAE6-3EE0-BA57-AC355292FCB9> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/system/libcorecrypto_sim.dylib
 0x30fe000 -  0x3103ff2 +libcompiler_rt_sim.dylib (57) <DA0A65B6-AC07-3C98-A612-4BA59FAC83A5> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/system/libcompiler_rt_sim.dylib
 0x310c000 -  0x3114ffb +libcopyfile_sim.dylib (103) <155C0F1D-257F-33CE-9FAC-45DB18C35404> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/system/libcopyfile_sim.dylib
 0x311a000 -  0x3137ff7 +libdispatch.dylib (354.10.5) <4DE063E1-5BE0-3375-A32A-9E0426945BD6> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/system/libdispatch.dylib
 0x314c000 -  0x314cfff +libdyld_sim.dylib (324.1) <43A82553-2CD3-338B-A2FB-D3B3DF869C10> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/system/libdyld_sim.dylib
 0x3150000 -  0x3154ff7 +libmacho_sim.dylib (846.2.4) <A18E662F-6A24-3930-B283-720BDA503B38> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/system/libmacho_sim.dylib
 0x3159000 -  0x3162fff +libnotify_sim.dylib (121) <0AC6CC08-25EB-3749-B5F4-5FA06DC86DFC> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/system/libnotify_sim.dylib
 0x3169000 -  0x316bfff +libremovefile_sim.dylib (33) <36E0F857-21BA-33C9-BB8C-666C92EF4331> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/system/libremovefile_sim.dylib
 0x3170000 -  0x3171fff +libsystem_sim_blocks.dylib (64) <C89A714B-EB1D-39D7-A3CB-D643B3AC4692> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/system/libsystem_sim_blocks.dylib
 0x3175000 -  0x3201ff7 +libsystem_sim_c.dylib (1002.10.1) <785B9921-E6E0-3FB4-8CAC-E207FF22F087> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/system/libsystem_sim_c.dylib
 0x3224000 -  0x322cff7 +libsystem_sim_dnssd.dylib (539.10.1) <D44EE83B-AB0B-315F-A975-61743788B225> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/system/libsystem_sim_dnssd.dylib
 0x3232000 -  0x325aff3 +libsystem_sim_info.dylib (452) <481EC5F2-E56F-3D12-9362-ED378895AF50> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/system/libsystem_sim_info.dylib
 0x326b000 -  0x329bfff +libsystem_sim_m.dylib (3061) <53131E41-B52A-3C45-82B3-32985E09BC7A> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/system/libsystem_sim_m.dylib
 0x32a2000 -  0x32cffff +libsystem_network.dylib (268.3) <62F57433-F067-3266-8AF1-1312BBBA8CB3> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/system/libsystem_network.dylib
 0x32e6000 -  0x32edffb +libunwind_sim.dylib (59.3) <B7DF590E-E733-317A-BB84-0D61F6F66EC9> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/system/libunwind_sim.dylib
 0x32f4000 -  0x331dfff +libxpc.dylib (330.10.5) <81ED694C-488A-3466-8AA2-7E0518B10AED> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/system/libxpc.dylib
 0x3335000 -  0x3337fff +libsystem_sim_configuration.dylib (615.1) <2BBC9E19-08DE-3F2C-B299-A95C72E53015> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/system/libsystem_sim_configuration.dylib
 0x333d000 -  0x3351ff3 +libsystem_sim_asl.dylib (224.10.2) <3773B273-EBB2-3779-BCAA-A9643026FDE7> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/system/libsystem_sim_asl.dylib
 0x335a000 -  0x335bfff  libSystem.B.dylib (1197.1.1) <C58F0CC9-C1FD-3024-9358-D3359A6BBCAD> /usr/lib/libSystem.B.dylib
 0x3362000 -  0x3365ff7 +libdyld.dylib (239.4) <F4604F64-945B-3871-8F26-E9C55488BC27> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/system/host/libdyld.dylib
 0x336c000 -  0x3371ff3  libsystem_platform.dylib (24.90.1) <0613F163-9A7A-3908-B30B-AC1627503933> /usr/lib/system/libsystem_platform.dylib
 0x3382000 -  0x339aff7  libsystem_malloc.dylib (23.10.1) <CB52555E-0F5B-31E3-A42A-FD4F930E2192> /usr/lib/system/libsystem_malloc.dylib
 0x33a3000 -  0x3435ff9  libsystem_c.dylib (997.90.3) <80D21D3D-1031-314C-B1F0-0B35B977CEFB> /usr/lib/system/libsystem_c.dylib
 0x345d000 -  0x3464ffb  libsystem_pthread.dylib (53.1.4) <8B1B7B84-1B5D-32A8-AC0D-1E689E5C8A4C> /usr/lib/system/libsystem_pthread.dylib
 0x346e000 -  0x3476fff  liblaunch.dylib (842.90.1) <B259692D-D60B-3BCE-9E03-32F457CB5046> /usr/lib/system/liblaunch.dylib
 0x347e000 -  0x347ffff  libsystem_blocks.dylib (63) <2AC67D5E-ECD4-3644-A53C-9684F9B7AA33> /usr/lib/system/libsystem_blocks.dylib
 0x3484000 -  0x34a1ff4  libsystem_kernel.dylib (2422.92.1) <20AE426A-E386-3119-A740-14E13CBD0596> /usr/lib/system/libsystem_kernel.dylib
 0x34c2000 -  0x34c7ff6  libcompiler_rt.dylib (35) <9924DF2E-D80B-3A21-920D-544A4597203F> /usr/lib/system/libcompiler_rt.dylib
 0x34d2000 -  0x34d8ffb  libunwind.dylib (35.3) <099D1A6F-A1F0-3D05-BF1C-0A7BB32D39C2> /usr/lib/system/libunwind.dylib
 0x34df000 -  0x3510ffa  libsystem_m.dylib (3047.16) <28E614E8-7802-3E84-960A-AD4721EF10F7> /usr/lib/system/libsystem_m.dylib
 0x351b000 -  0x351bfff  libkeymgr.dylib (28) <1B097DEA-011E-3B1C-86D5-6C7FAD5C765A> /usr/lib/system/libkeymgr.dylib
 0x3520000 -  0x3524ff7  libmacho.dylib (845) <D8E93E59-1F80-3413-B9CF-78B848F6E873> /usr/lib/system/libmacho.dylib
 0x3529000 -  0x353bfff  libsystem_asl.dylib (217.1.4) <51EB17C9-9F5B-39F3-B6CD-8EF238B05B89> /usr/lib/system/libsystem_asl.dylib
 0x3545000 -  0x356dfff  libsystem_info.dylib (449.1.3) <BB68E8CC-422F-3121-8C86-D0F766FB696D> /usr/lib/system/libsystem_info.dylib
 0x3581000 -  0x358afff  libsystem_notify.dylib (121) <623269F5-1518-3035-A916-8AF83C972154> /usr/lib/system/libsystem_notify.dylib
 0x3592000 -  0x3594fff  libquarantine.dylib (71) <EE3B510E-1AEC-3171-8A1A-D6A5A42CF35C> /usr/lib/system/libquarantine.dylib
 0x359a000 -  0x35eaff7  libcorecrypto.dylib (161.1) <135FD99E-2211-3DF4-825C-C9F816107F0C> /usr/lib/system/libcorecrypto.dylib
 0x35f9000 -  0x35fdffa  libcache.dylib (62) <9730D7F2-D226-3F30-8D26-BF598CB781F6> /usr/lib/system/libcache.dylib
 0x3602000 -  0x360dffb  libcommonCrypto.dylib (60049) <F8E60C43-22EE-3E0B-9546-3365056901F1> /usr/lib/system/libcommonCrypto.dylib
 0x361a000 -  0x3622fff  libcopyfile.dylib (103) <1B1484BD-08B6-3BA9-94CA-A7C24B610EB3> /usr/lib/system/libcopyfile.dylib
 0x3629000 -  0x362afff  libremovefile.dylib (33) <ED35EA79-EB06-3B84-A6D4-B1A9D6B8648D> /usr/lib/system/libremovefile.dylib
 0x3630000 -  0x3632fff  libsystem_configuration.dylib (596.13) <57095AFE-3FF1-3F42-A43E-ED679409B827> /usr/lib/system/libsystem_configuration.dylib
 0x3638000 -  0x3640fff  libsystem_dnssd.dylib (522.90.2) <A73663C9-CE65-3FF3-B41B-686728BBFB00> /usr/lib/system/libsystem_dnssd.dylib
 0x3646000 -  0x3647ffa  libsystem_sandbox.dylib (278.11) <E8BE1DF7-2F3D-3202-B807-A85C99220AB6> /usr/lib/system/libsystem_sandbox.dylib
 0x364c000 -  0x364dffd  libunc.dylib (28) <22A126A1-DCFB-3BE5-A66B-C973F0A5D839> /usr/lib/system/libunc.dylib
 0x3653000 -  0x3662fff +libz.1.dylib (53) <2AAA43FE-64D5-32AF-BA94-E17B6C6E72ED> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/libz.1.dylib
 0x3667000 -  0x390dfc7 +vImage (271.4) <2908B111-DF61-3017-96E4-33C2016F789E> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/Accelerate.framework/Frameworks/vImage.framework/vImage
 0x3949000 -  0x3949ffd +vecLib (459) <2D8979A3-112E-37A2-8242-FB04198CC93B> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/Accelerate.framework/Frameworks/vecLib.framework/vecLib
 0x394d000 -  0x3a21ff7 +libvDSP.dylib (459) <48FD781C-8C55-30B3-938B-253592BD3802> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/Accelerate.framework/Frameworks/vecLib.framework/libvDSP.dylib
 0x3a2d000 -  0x3a90ff7 +libstdc++.6.dylib (100) <D8AF350B-7655-35ED-A801-2B7942638B01> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/libstdc++.6.dylib
 0x3af0000 -  0x3ecdff3 +libLAPACK.dylib (1104) <8ECF20E6-CDC5-387C-A3CA-C9C9444F8FF0> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/Accelerate.framework/Frameworks/vecLib.framework/libLAPACK.dylib
 0x3efa000 -  0x4052feb +libBLAS.dylib (1104) <D90A95FA-3FC9-3050-933D-1385DFACAC14> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/Accelerate.framework/Frameworks/vecLib.framework/libBLAS.dylib
 0x406a000 -  0x40f5fff +libvMisc.dylib (459) <6AAB2FB6-9110-3A87-B4C2-8D5890F021DE> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/Accelerate.framework/Frameworks/vecLib.framework/libvMisc.dylib
 0x40fd000 -  0x41feffb +libxml2.2.dylib (25.6) <53C064BF-2171-3E4E-BFFF-30EEA58F947B> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/libxml2.2.dylib
 0x422d000 -  0x42a0ffb +IOKit (920.10.34) <ED3AD6C6-3A7E-3A83-B2E9-1927907EC14E> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/IOKit.framework/Versions/A/IOKit
 0x42d0000 -  0x42efff7 +libCRFSuite.dylib (32) <AD3683C3-45F1-305E-B431-B4A0AA6A74CD> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/libCRFSuite.dylib
 0x42f9000 -  0x42fafff +liblangid.dylib (114) <314CB64D-B0A7-3F67-85A4-9672BB7257F4> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/liblangid.dylib
 0x42fe000 -  0x4318fff +libMobileGestalt.dylib (241.5) <0E82A66B-B230-34EF-AE81-3786F94FCFA2> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/libMobileGestalt.dylib
 0x4334000 -  0x4347fff +libbsm.0.dylib (28) <E65EA530-51C8-3DC2-99F6-0007DA07B52C> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/libbsm.0.dylib
 0x434f000 -  0x436dff7 +SpringBoardServices (2618.99.15) <3BCC1FBB-C3E9-351B-A7FD-80CDD72B3A16> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices
 0x4384000 -  0x43bfffb +BackBoardServices (2618.99.15) <B1AD72A5-82DB-3016-B3B3-2FDE5923AB05> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/BackBoardServices.framework/BackBoardServices
 0x43f0000 -  0x4407fff +GraphicsServices (575.6) <F8E404EF-102E-3165-B25B-BCFA9F6ADDF2> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/GraphicsServices.framework/GraphicsServices
 0x441b000 -  0x4424ffb +XPCObjects (46) <3ACEDCC8-CDEF-3808-83D3-25F4D9AE73C2> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/XPCObjects.framework/XPCObjects
 0x442f000 -  0x4432ffb +ConstantClasses (1.4) <3C9650FB-1A71-3C58-AC10-59CEBFA8C6E5> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/ConstantClasses.framework/ConstantClasses
 0x4439000 -  0x450ffff +libsqlite3.dylib (158.1) <62CB14CB-3689-3D28-8362-D71B4B385DE1> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/libsqlite3.dylib
 0x4523000 -  0x461eff3 +UIFoundation (264.8) <46DF5B89-8CE3-3525-9F22-31B50CF182C4> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/UIFoundation.framework/UIFoundation
 0x4679000 -  0x46f7fff +CoreUI (232.4) <2EE91D7F-4367-3676-A61D-76E32E67E3AC> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/CoreUI.framework/CoreUI
 0x4761000 -  0x4a30fff +VideoToolbox (1329.160) <BF7D438C-FBF7-363A-801E-7FA9A6C69432> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/VideoToolbox.framework/VideoToolbox
 0x4aa0000 -  0x4ab0ff3 +MobileAsset (215.11) <AECAE8E7-E5F3-3A7F-8A5A-B9981B610780> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/MobileAsset.framework/MobileAsset
 0x4abc000 -  0x4ae8ff7 +TelephonyUtilities (1) <8F4D5743-F68A-38B5-9C12-D73FD8B9B738> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/TelephonyUtilities.framework/TelephonyUtilities
 0x4b0d000 -  0x4b32ff3 +DictionaryServices (209) <7A3D872C-9258-3F9F-9D31-D7398C0E38DF> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/DictionaryServices.framework/DictionaryServices
 0x4b4d000 -  0x4ba3ff3 +AppSupport (893.20) <EEAD1C38-5B8F-39E4-9145-6443D289801F> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/AppSupport.framework/AppSupport
 0x4bd6000 -  0x4c18fff +TextInput (1453.32) <8CBCFAE7-DA57-3DE0-9FC6-46C79FA3985D> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/TextInput.framework/TextInput
 0x4cb0000 -  0x4dbeff7 +WebKit (1385.20) <D6C6D0ED-CB6B-3640-BEF9-5FD5DF6AA170> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/WebKit.framework/WebKit
 0x4e6a000 -  0x63d7ff3 +WebCore (1889.59) <87E40C36-5B5F-319E-B762-C4875A9BBE96> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/WebCore.framework/WebCore
 0x6c7a000 -  0x6d3bff7 +ProofReader (232) <7D308213-C3AD-30B1-A612-E47B96BC0CEC> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/ProofReader.framework/ProofReader
 0x6d5b000 -  0x6d68fff +libAccessibility.dylib (1210.31) <2D47E28E-E0E5-3BC8-9D96-6608CBCBBAC4> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/libAccessibility.dylib
 0x6d76000 -  0x6dc1fff +PrintKit (141.3) <08E7A578-2C4D-3B34-AA08-118177E0A677> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/PrintKit.framework/PrintKit
 0x6ddf000 -  0x6e23ff7 +PhysicsKit (6.5.4) <F1140A98-D029-307A-831D-B446B58DC18A> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/PhysicsKit.framework/PhysicsKit
 0x6e3d000 -  0x6e46ffb +libGFXShared.dylib (9.4.3) <A9C4F7C3-8665-3A88-AA81-0951607FD73C> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/OpenGLES.framework/libGFXShared.dylib
 0x6e4d000 -  0x6e91fff +libGLImage.dylib (9.4.3) <BF8CC78D-16A4-3B24-81D8-5342273EC983> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/OpenGLES.framework/libGLImage.dylib
 0x6e9a000 -  0x6e9cfff +libCVMSPluginSupport.dylib (9.4.3) <CEC8828F-44FB-3363-900E-98F54D6F992A> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/OpenGLES.framework/libCVMSPluginSupport.dylib
 0x6ea1000 -  0x6eacff3 +libCoreVMClient.dylib (65.6) <2A55A09F-568F-3A30-9D24-486996D04245> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/OpenGLES.framework/libCoreVMClient.dylib
 0x6eb5000 -  0x7843fea +libLLVMContainer.dylib (65.6) <1D87BB80-6E80-3645-A5FB-6EB7A38D3A43> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/OpenGLES.framework/libLLVMContainer.dylib
 0x7aef000 -  0x7b27ff7 +Bom (189) <C0194F16-EEB8-3C34-912E-DDFA67B0154C> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/Bom.framework/Bom
 0x7b36000 -  0x7b43fff +libbz2.1.0.dylib (31) <7290B90B-0F1B-3DD4-A4A5-1CBE4FC38627> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/libbz2.1.0.dylib
 0x7b48000 -  0x7f7afff +FaceCore (3.0.2) <F4C3FECB-4936-3F25-93D1-C29C48707501> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/FaceCore.framework/FaceCore
 0x818e000 -  0x818fffb +SimulatorClient (463.9.41) <0564E696-7DBC-3784-B68E-56116CA41C6B> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/SimulatorClient.framework/SimulatorClient
 0x8194000 -  0x81a5ffb +AssetsLibraryServices (2056.42) <9AFD87C7-CFF0-3BB5-B5C8-97BD3C56521F> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/AssetsLibraryServices.framework/AssetsLibraryServices
 0x81b5000 -  0x81b9ff7 +TCC (87.10.3) <4E3AD631-2368-317D-A6E0-945BA0899CF1> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/TCC.framework/TCC
 0x81bf000 -  0x81c9ff3 +CommonUtilities (25.2) <2B2A2AD7-F4DB-3CD2-95F0-6CAA577C4B14> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/CommonUtilities.framework/CommonUtilities
 0x81d2000 -  0x81d6fff +CommunicationsFilter (37) <A2DFBD89-07DF-336C-9DD9-B390418DA0AF> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/CommunicationsFilter.framework/CommunicationsFilter
 0x81db000 -  0x8263ff3 +AddressBook (10898.7) <0271306D-8429-3650-9A77-085A7A720C34> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/AddressBook.framework/AddressBook
 0x82a5000 -  0x835eff7 +CoreTelephony (1779) <8587C4F2-C5C1-3F21-AE87-0C5A73F215BE> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/CoreTelephony.framework/CoreTelephony
 0x83b4000 -  0x8421ff7 +IMFoundation (163.3) <A2909DD0-5D5A-3F0E-877F-B19BEF57B661> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/IMFoundation.framework/IMFoundation
 0x8452000 -  0x8482ff3 +libtidy.A.dylib (15.11) <FB319B8A-20EF-3C1D-B76A-DD206D354222> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/libtidy.A.dylib
 0x848f000 -  0x84bafff +Accounts (404.22) <0CE4BEB0-5A30-37F0-B353-F804ED63CBCA> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/Accounts.framework/Accounts
 0x84d7000 -  0x84dcfff +AggregateDictionary (200.24) <5466188E-382B-333B-950A-B9D228D2AEE5> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/AggregateDictionary.framework/AggregateDictionary
 0x84e4000 -  0x8502ff3 +DataAccessExpress (1251.28) <F684CD9C-F3D7-3A44-87B4-2F3E3306CDBE> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/DataAccessExpress.framework/DataAccessExpress
 0x851b000 -  0x87a9ff7 +CoreData (479.3) <63814BBD-A632-353A-914E-560F76A13750> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/CoreData.framework/CoreData
 0x8881000 -  0x8884fff +OAuth (25) <4706D041-4F18-3775-A535-56AF327C9796> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/OAuth.framework/OAuth
 0x8889000 -  0x888dfff +DataMigration (893.20) <C982BC1E-FCEC-3483-82C6-2ACBB0B27752> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/DataMigration.framework/DataMigration
 0x8894000 -  0x88abffb +libTelephonyUtilDynamic.dylib (527) <C9E0BFAB-E96C-3871-819A-0091607F7831> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/libTelephonyUtilDynamic.dylib
 0x88d2000 -  0x88feff3 +libxslt.1.dylib (13) <52FF63DC-89E9-3DEB-9C29-BF29BE6D378F> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/libxslt.1.dylib
 0x890a000 -  0x8d31ffb +JavaScriptCore (1218.33) <6D1651FE-44C4-30B6-8DAB-B482A9F7530A> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/JavaScriptCore.framework/JavaScriptCore
 0x8e1b000 -  0x8e22ff7 +MediaAccessibility (43) <E634C857-2B47-3C91-A3F3-22F6CCF371EE> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/MediaAccessibility.framework/MediaAccessibility
 0x8e2d000 -  0x8e33fff +CertUI (73) <CE41E426-324B-3E45-9E44-966AF7D0BCBA> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/CertUI.framework/CertUI
 0x8e3b000 -  0x8f2efff +libiconv.2.dylib (41) <926F1856-8A9A-3988-95AF-051C1089ABCC> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/libiconv.2.dylib
 0x8f3c000 -  0x8f5bff7 +libresolv.9.dylib (54) <64970671-835A-3ECF-ADBE-9F723F262681> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/libresolv.9.dylib
 0x94d9000 -  0x94deff7 +AccessibilitySettingsLoader (1210.31) <E68126B0-4F45-3571-B5D4-824E3E822A97> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/AccessibilityBundles/AccessibilitySettingsLoader.bundle/AccessibilitySettingsLoader
 0x94e7000 -  0x94ecff7 +libAXSpeechManager.dylib (1210.31) <AF649075-50FC-3168-AD45-6EEB73D710E7> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/libAXSpeechManager.dylib
 0x94f3000 -  0x94f4fff +libAXSafeCategoryBundle.dylib (1210.31) <CA1C8F78-5E35-3F83-AAC7-7E1A2C996872> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/usr/lib/libAXSafeCategoryBundle.dylib
 0xd956000 -  0xdaa1ff3 +AVFoundation (696.115) <928AEAC0-3FB3-3230-8BC9-66AE9400BB68> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/AVFoundation.framework/AVFoundation
 0xdb84000 -  0xdbecfff +AccessibilityUtilities (1210.31) <DECBECF9-DCC0-36B9-91F7-AC0B7EB36A6B> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/AccessibilityUtilities.framework/AccessibilityUtilities
 0xdc2e000 -  0xdc5effb +libAVFAudio.dylib (42.11) <9723BFAC-C807-3ECB-9F4F-3906217FF217> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/AVFoundation.framework/libAVFAudio.dylib
 0xdc78000 -  0xe018ff7 +AudioToolbox (610.25) <46038B4A-A27B-3995-A0E5-5A5A7E88C2FA> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/AudioToolbox.framework/AudioToolbox
 0xe0f9000 -  0xe377ffb +MediaToolbox (1329.160) <6860E346-1045-374A-85A7-455B2494A41B> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/MediaToolbox.framework/MediaToolbox
 0xe430000 -  0xe45fffb +Celestial (1329.160) <85C74E50-1725-35D8-832D-7240FB454896> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/Celestial.framework/Celestial
 0xe48d000 -  0xe492fff +BTLEAudioController (87.16) <A8C03F6C-C0A1-3C07-82E1-D2A29F681E6F> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/BTLEAudioController.framework/BTLEAudioController
 0xe49b000 -  0xe74aff7 +TextToSpeech (10.3) <8E1BC2E7-EF34-349B-A25E-EF51B0D6B81D> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/TextToSpeech.framework/TextToSpeech
 0xe7ad000 -  0xe7d7fff +PersistentConnection (1) <038E8136-135C-3D8C-8105-5AEBBC6FEE24> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/PersistentConnection.framework/PersistentConnection
 0xe7f6000 -  0xe81fff3 +ScreenReaderCore (69.1.1) <1BB3D179-D762-3A30-A60C-37E1573DE2A2> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/ScreenReaderCore.framework/ScreenReaderCore
 0xe83c000 -  0xe872ffb +UIAccessibility (1210.31) <0C39A191-E954-36B2-97CB-7B879BF785A2> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/UIAccessibility.framework/UIAccessibility
 0xe898000 -  0xe8c4ff3 +AXRuntime (1210.31) <91616B84-7F45-30B5-9FF2-A116222AFB3B> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/AXRuntime.framework/AXRuntime
 0xea00000 -  0xeaafff7 +UIKit (1210.31) <876B8F42-3A44-3EA8-AF3C-88D35AC9651E> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/AccessibilityBundles/UIKit.axbundle/UIKit
 0xeb39000 -  0xeb58ff3 +DataDetectorsCore (355.1) <B2229269-D9EB-39A9-AB8C-9509944F9347> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/PrivateFrameworks/DataDetectorsCore.framework/DataDetectorsCore
 0xeb6d000 -  0xebbafff +libCGFreetype.A.dylib (580.4) <EDEE16EE-7FFE-3B65-B369-97BC1B7096B7> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/CoreGraphics.framework/Resources/libCGFreetype.A.dylib
 0xebd2000 -  0xebe0ff3 +libCMSBuiltin.A.dylib (580.4) <C9CB38ED-9960-3840-9337-50FB708C599B> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/CoreGraphics.framework/Resources/libCMSBuiltin.A.dylib
 0xf11d000 -  0xf145ff3 +libRIP.A.dylib (580.4) <EB847519-BDC5-318B-9391-45E9DDFF60EB> /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator7.1.sdk/System/Library/Frameworks/CoreGraphics.framework/Resources/libRIP.A.dylib
 0xf152000 -  0xfcb8fdb +librubymotion-repl.dylib (0) <25657423-8FAF-32FC-B9D9-9B114A099C76> /Library/RubyMotion/*/librubymotion-repl.dylib
0x8fef2000 - 0x8ff24417  dyld (239.4) <2E655535-479B-3E48-ADD3-6278819CA38A> /usr/lib/dyld

External Modification Summary:
  Calls made by other processes targeting this process:
    task_for_pid: 0
    thread_create: 0
    thread_set_state: 0
  Calls made by this process:
    task_for_pid: 0
    thread_create: 0
    thread_set_state: 0
  Calls made by all processes on this machine:
    task_for_pid: 2790926
    thread_create: 1
    thread_set_state: 276

VM Region Summary:
ReadOnly portion of Libraries: Total=165.0M resident=76.3M(46%) swapped_out_or_unallocated=88.7M(54%)
Writable regions: Total=57.8M written=5280K(9%) resident=11.4M(20%) swapped_out=0K(0%) unallocated=46.4M(80%)
 
REGION TYPE                      VIRTUAL
===========                      =======
Kernel Alloc Once                     4K
MALLOC                             42.2M
MALLOC (admin)                       48K
Stack                              65.1M
VM_ALLOCATE                         812K
__DATA                             9660K
__LINKEDIT                         34.9M
__OBJC                                4K
__PAGEZERO                            4K
__TEXT                            130.1M
__UNICODE                           544K
mapped file                       299.9M
shared memory                         4K
===========                      =======
TOTAL                             583.0M

 
 ```
