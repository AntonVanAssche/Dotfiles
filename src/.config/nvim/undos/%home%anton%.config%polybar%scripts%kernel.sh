Vim�UnDo� 	��M�𱫂%��勇����o��+XF)�3;      KERNEL_INFO="$(uname -sr)"                             b�.   	 _�                        
    ����                                                                                                                                                                                                                                                                                                                                                             b�-�    �               %printf '%s %s' "$ICON" "$KERNEL_INFO"5��       
                  >                      5�_�                           ����                                                                                                                                                                                                                                                                                                                                                             b�-�    �               KERNEL_INFO="$(uname -sr)"5��                         0                      �                        3                     �                        3                     �                        3                     �                         8                     �       &                 >                     �       &                 >                     5�_�                       #    ����                                                                                                                                                                                                                                                                                                                                                             b�-�     �               *KERNEL_INFO="$(uname -sr | sed 's/-*//g')"5��       #                  ;                      5�_�                       $    ����                                                                                                                                                                                                                                                                                                                                                             b�-�    �               ,KERNEL_INFO="$(uname -sr | sed 's/-[]*//g')"5��       $                  <                      �       &                 >                     5�_�                      %    ����                                                                                                                                                                                                                                                                                                                                                             b�-�    �               /KERNEL_INFO="$(uname -sr | sed 's/-[1-9]*//g')"5��       $                 <                     �       $                 <                     �       $                 <                     5�_�                       )    ����                                                                                                                                                                                                                                                                                                                                                             b�-�     �               /KERNEL_INFO="$(uname -sr | sed 's/-[0-9]*//g')"5��       )                  A                      5�_�      	                 *    ����                                                                                                                                                                                                                                                                                                                                                             b�-�     �               0KERNEL_INFO="$(uname -sr | sed 's/-[0-9]*.//g')"5��       *                  B                      5�_�      
           	      +    ����                                                                                                                                                                                                                                                                                                                                                             b�-�    �               2KERNEL_INFO="$(uname -sr | sed 's/-[0-9]*.[]//g')"5��       +                  C                      �       /                  G                      5�_�   	              
      0    ����                                                                                                                                                                                                                                                                                                                                                             b�.     �               6KERNEL_INFO="$(uname -sr | sed 's/-[0-9]*.[a-z]*//g')"5��       '       	           ?       	               5�_�   
                    +    ����                                                                                                                                                                                                                                                                                                                                                             b�.    �               -KERNEL_INFO="$(uname -sr | sed 's/-[0-9//g')"5��                        3                     �                        5                     �                         8                     �       '                 ?                     �       )                 A                     5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             b�.   	 �               ,KERNEL_INFO="$(uname -sr | cut -d '-' -f 1)"5��                         .                      5�_�                       "    ����                                                                                                                                                                                                                                                                                                                                                             b�-�    �               .KERNEL_INFO="$(uname -sr | sed 's/[1-9]*//g')"5��       "                  :                      5��