HCC2 - V 0.3-9
==============

hcc2:  Heterogeneous Compiler Collection (Version 2). 

This is README.md for https:/github.com/ROCM-Developer-Tools/hcc2 .  This is the base repository for HCC2,  Use this for issues, documentation, packaging, examples, build.  

HCC2 is an experimental PROTOTYPE that is intended to support multiple programming models including OpenMP 4.5+, C++ parallel extentions (original HCC), and cuda clang.  It supports offloading to multiple GPU acceleration targets(multi-target).  It also supports different host platforms such as AMD64, PPC64LE, and AARCH64. (multi-platform). 
The bin directory of this repository contains a README and build scripts needed to build HCC2.

Attention Users!  Use this repository for issues. Do not put issues in the source code repositories.  Before creating an issue, you may want to see the developers list of TODOs.  See link below.

Table of contents
-----------------

- [Copyright and Disclaimer](#Copyright)
- [Software License Agreement](LICENSE)
- [Install](#Install)
- [Examples](examples)
- [Development](DEVELOPMENT.md)
- [TODOs](bin/TODOs) List of TODOs for this release
- [Limitations](#Limitations)

## Copyright and Disclaimer

<A NAME="Copyright">
Copyright (c) 2017 ADVANCED MICRO DEVICES, INC.

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

## HCC2 Install

<A NAME="Install">
On Ubuntu 16.04 LTS (xenial), run these commands:

```
wget https://github.com/ROCm-Developer-Tools/hcc2/releases/download/rel_0.3-9/hcc2_0.3-9_amd64.deb
wget https://github.com/ROCm-Developer-Tools/hcc2/releases/download/rel_0.3-9/libamdgcn_0.3-9_all.deb
sudo dpkg -i hcc2_0.3-9_amd64.deb
sudo dpkg -i libamdgcn_0.3-9_all.deb
```

For rpm based Linux system, run the following commands:

```
wget https://github.com/ROCm-Developer-Tools/hcc2/releases/download/rel_0.3-9/hcc2-0.3-9.x86_64.rpm
wget https://github.com/ROCm-Developer-Tools/hcc2/releases/download/rel_0.3-9/libamdgcn-0.3-9.noarch.rpm
sudo rpm -i hcc2-0.3-9.x86_64.rpm
sudo rpm -i libamdgcn-0.3-9.noarch.rpm
```

Warning, the above wget commands will only work AFTER the release has been packaged. If the wget fails, try another release. 

## HCC2 Limitations

<A NAME="Limitations">
There are too many to mention at this time.  Hey, this is a prototype.
