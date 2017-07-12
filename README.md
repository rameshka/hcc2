HCC2 - V 0.3-6 
==============

hcc2:  Heterogeneous Compiler Collection (Version 2). 

This is README.md for https:/github.com/ROCM-Developer-Tools/hcc2

This is the master repository for hcc2,  Use this for issues, documentation, packaging, examples, build.  

Do not put development source code here other than examples and build scripts.  The bin directory of this 
repository contains a README and build scripts needed to build HCC2.

Attention Users!  Use this repository for issues.   Do not put issues in the source code repositories. 

Table of contents
-----------------

- [Copyright and Disclaimer](#Copyright)
- [Software License Agreement](LICENSE.TXT)
- [Repositories](#Repositories)
- [Examples](examples)
- [Install](bin/README)



<A NAME="Copyright">
# Copyright and Disclaimer
------------------------

Copyright (c) 2016 ADVANCED MICRO DEVICES, INC.  

AMD is granting you permission to use this software and documentation (if any) (collectively, the 
Materials) pursuant to the terms and conditions of the Software License Agreement included with the 
Materials.  If you do not have a copy of the Software License Agreement, contact your AMD 
representative for a copy.

You agree that you will not reverse engineer or decompile the Materials, in whole or in part, except for 
example code which is provided in source code form and as allowed by applicable law.

WARRANTY DISCLAIMER: THE SOFTWARE IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY 
KIND.  AMD DISCLAIMS ALL WARRANTIES, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING BUT NOT 
LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
PURPOSE, TITLE, NON-INFRINGEMENT, THAT THE SOFTWARE WILL RUN UNINTERRUPTED OR ERROR-
FREE OR WARRANTIES ARISING FROM CUSTOM OF TRADE OR COURSE OF USAGE.  THE ENTIRE RISK 
ASSOCIATED WITH THE USE OF THE SOFTWARE IS ASSUMED BY YOU.  Some jurisdictions do not 
allow the exclusion of implied warranties, so the above exclusion may not apply to You. 

LIMITATION OF LIABILITY AND INDEMNIFICATION:  AMD AND ITS LICENSORS WILL NOT, 
UNDER ANY CIRCUMSTANCES BE LIABLE TO YOU FOR ANY PUNITIVE, DIRECT, INCIDENTAL, 
INDIRECT, SPECIAL OR CONSEQUENTIAL DAMAGES ARISING FROM USE OF THE SOFTWARE OR THIS 
AGREEMENT EVEN IF AMD AND ITS LICENSORS HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH 
DAMAGES.  In no event shall AMD's total liability to You for all damages, losses, and 
causes of action (whether in contract, tort (including negligence) or otherwise) 
exceed the amount of $100 USD.  You agree to defend, indemnify and hold harmless 
AMD and its licensors, and any of their directors, officers, employees, affiliates or 
agents from and against any and all loss, damage, liability and other expenses 
(including reasonable attorneys' fees), resulting from Your use of the Software or 
violation of the terms and conditions of this Agreement.  

U.S. GOVERNMENT RESTRICTED RIGHTS: The Materials are provided with "RESTRICTED RIGHTS." 
Use, duplication, or disclosure by the Government is subject to the restrictions as set 
forth in FAR 52.227-14 and DFAR252.227-7013, et seq., or its successor.  Use of the 
Materials by the Government constitutes acknowledgement of AMD's proprietary rights in them.

EXPORT RESTRICTIONS: The Materials may be subject to export restrictions as stated in the 
Software License Agreement.

<A NAME="Repositories">
HCC2 Repositories
-----------------
The hcc2 compiler is an LLVM and CLANG 5 comipiler.  It requires a number of repositories to build

```
https:/github.com/ROCM-Developer-Tools/hcc2-clang
Original: 		https://github.com/radeonOpenCompute/hcc-clang-upgrade  branch:clang_tot_upgrade
Master Branch :  	master
Current Release Branch: none
Current Dev Branch:  	0.3-6
The master branch of this repository is a clone of the HCC development branch clang_tot_upgrade.  It containes the amdgcn the support the new address space and alloca in address space 5 (local). 
The development branch 0.3-6 contains significant changes to support OpenMP 4.5 partially taken from the IBM coral compiler as well as additional support for amdgcn. 

https:/github.com/ROCM-Developer-Tools/hcc2-llvm
Original: 		https://github.com/radeonOpenCompute/llvm   branch:amd-hcc
Master Branch:  	master This is a copy of amd-hcc as of June 27
Current Release Branch: none
Current Dev Branch:  	0.3-6
The master branch of this repository is a clone of the HCC development branch amd-hcc.  It containes the amdgcn backend to support the new address space and alloca in address space 5 (local).  The only updates we need for hcc2 are to accept the osname "cuda" in the triple to trigger the new address space scheme. 

https:/github.com/ROCM-Developer-Tools/hcc2-lld
Original: 		https://github.com/radeonOpenCompute/lld   branch:amd-hcc
Master Branch:  	master This is a copy of amd-hcc as of June 27
Current Release Branch: none
Current Dev Branch:  	0.3-6
The master branch of this repository is a clone of the HCC development branch amd-hcc.   There are no changes to lld to support hcc2.  So the develoment branch is identical to the master branch. 

https:/github.com/ROCM-Developer-Tools/hcc2-rt
Original: 		https://github.com/clang-ykt/openmp branch:master
Master Branch:  	master This is a copy of original master(ykk) as of June 27)
Current Release Branch: none
Current Dev Branch:  	0.3-6
This repository is the IBM Coral compiler openmp runtime with significant updates to support AMDGCN. 
```

Attention Developers!   Please only update the current development branch.  Do not update the master.  From time to time, we will pull changes to the master from their original location and then update our development branch. 

Attention Users and Developers!  Do not build from the master branch.  You must build from the release branch or the development branch.  See the README in bin/README. 

