-------------------------------------------------------------------------------
-- Copyright (c) 2015, Daniel King
-- All rights reserved.
--
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:
--     * Redistributions of source code must retain the above copyright
--       notice, this list of conditions and the following disclaimer.
--     * Redistributions in binary form must reproduce the above copyright
--       notice, this list of conditions and the following disclaimer in the
--       documentation and/or other materials provided with the distribution.
--     * The name of the copyright holder may not be used to endorse or promote
--       Products derived from this software without specific prior written
--       permission.
--
-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-- IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
-- ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE FOR ANY
-- DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
-- (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
-- LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
-- ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
-- (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
-- THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
-------------------------------------------------------------------------------

with KeccakF_Tests;
with Keccak.Keccak_1600;
with Keccak.Keccak_800;
with Keccak.Keccak_400;
with Keccak.Keccak_200;
with Keccak.Keccak_100;
with Keccak.Keccak_50;
with Keccak.Keccak_25;
with AUnit.Test_Caller;

package body KeccakF_Suite
is
   package KeccakF_1600_Tests is new KeccakF_Tests
      (Keccak.Keccak_1600.KeccakF_1600,
       Keccak.Keccak_1600.KeccakF_1600_Lanes.XOR_Bits_Into_State,
       Keccak.Keccak_1600.KeccakF_1600_Lanes.Extract_Bytes);
       
   package KeccakF_800_Tests is new KeccakF_Tests
      (Keccak.Keccak_800.KeccakF_800,
       Keccak.Keccak_800.KeccakF_800_Lanes.XOR_Bits_Into_State,
       Keccak.Keccak_800.KeccakF_800_Lanes.Extract_Bytes);
       
   package KeccakF_400_Tests is new KeccakF_Tests
      (Keccak.Keccak_400.KeccakF_400,
       Keccak.Keccak_400.KeccakF_400_Lanes.XOR_Bits_Into_State,
       Keccak.Keccak_400.KeccakF_400_Lanes.Extract_Bytes);
       
   package KeccakF_200_Tests is new KeccakF_Tests
      (Keccak.Keccak_200.KeccakF_200,
       Keccak.Keccak_200.KeccakF_200_Lanes.XOR_Bits_Into_State,
       Keccak.Keccak_200.KeccakF_200_Lanes.Extract_Bytes);
       
   package KeccakF_100_Tests is new KeccakF_Tests
      (Keccak.Keccak_100.KeccakF_100,
       Keccak.Keccak_100.KeccakF_100_Lanes.XOR_Bits_Into_State,
       Keccak.Keccak_100.KeccakF_100_Lanes.Extract_Bytes);
       
   package KeccakF_50_Tests is new KeccakF_Tests
      (Keccak.Keccak_50.KeccakF_50,
       Keccak.Keccak_50.KeccakF_50_Lanes.XOR_Bits_Into_State,
       Keccak.Keccak_50.KeccakF_50_Lanes.Extract_Bytes);
       
   package KeccakF_25_Tests is new KeccakF_Tests
      (Keccak.Keccak_25.KeccakF_25,
       Keccak.Keccak_25.KeccakF_25_Lanes.XOR_Bits_Into_State,
       Keccak.Keccak_25.KeccakF_25_Lanes.Extract_Bytes);
          
   package Caller_1600 is new AUnit.Test_Caller (KeccakF_1600_Tests.Test);
   package Caller_800  is new AUnit.Test_Caller (KeccakF_800_Tests.Test);
   package Caller_400  is new AUnit.Test_Caller (KeccakF_400_Tests.Test);
   package Caller_200  is new AUnit.Test_Caller (KeccakF_200_Tests.Test);
   package Caller_100  is new AUnit.Test_Caller (KeccakF_100_Tests.Test);
   package Caller_50   is new AUnit.Test_Caller (KeccakF_50_Tests.Test);
   package Caller_25   is new AUnit.Test_Caller (KeccakF_25_Tests.Test);

   function Suite return Access_Test_Suite
   is
   
      Ret : constant Access_Test_Suite := new Test_Suite;
   begin
      Ret.Add_Test(Caller_1600.Create("Keccak-f[1600]: Test initial Keccak state is zero", 
                                      KeccakF_1600_Tests.Test_Initial_State'Access));
      Ret.Add_Test(Caller_1600.Create("Keccak-f[1600]: Test Extract_Bytes",
                                      KeccakF_1600_Tests.Test_Extract_Bytes'Access));
      Ret.Add_Test(Caller_1600.Create("Keccak-f[1600]: Test XOR 0 bits into the Keccak state", 
                                      KeccakF_1600_Tests.Test_XOR_No_Data'Access));
      Ret.Add_Test(Caller_1600.Create("Keccak-f[1600]: Test XOR all bits into the Keccak state", 
                                      KeccakF_1600_Tests.Test_XOR_Entire_State'Access));
      Ret.Add_Test(Caller_1600.Create("Keccak-f[1600]: Test XOR is correct all possible bit-lengths", 
                                      KeccakF_1600_Tests.Test_XOR_Bit_Length'Access));
                                 
      Ret.Add_Test(Caller_800.Create("Keccak-f[800]: Test initial Keccak state is zero", 
                                      KeccakF_800_Tests.Test_Initial_State'Access));
      Ret.Add_Test(Caller_800.Create("Keccak-f[800]: Test Extract_Bytes",
                                      KeccakF_800_Tests.Test_Extract_Bytes'Access));
      Ret.Add_Test(Caller_800.Create("Keccak-f[800]: Test XOR 0 bits into the Keccak state", 
                                      KeccakF_800_Tests.Test_XOR_No_Data'Access));
      Ret.Add_Test(Caller_800.Create("Keccak-f[800]: Test XOR all bits into the Keccak state", 
                                      KeccakF_800_Tests.Test_XOR_Entire_State'Access));
      Ret.Add_Test(Caller_800.Create("Keccak-f[800]: Test XOR is correct all possible bit-lengths", 
                                      KeccakF_800_Tests.Test_XOR_Bit_Length'Access));
                                 
      Ret.Add_Test(Caller_400.Create("Keccak-f[400]: Test initial Keccak state is zero", 
                                      KeccakF_400_Tests.Test_Initial_State'Access));
      Ret.Add_Test(Caller_400.Create("Keccak-f[400]: Test Extract_Bytes",
                                      KeccakF_400_Tests.Test_Extract_Bytes'Access));
      Ret.Add_Test(Caller_400.Create("Keccak-f[400]: Test XOR 0 bits into the Keccak state", 
                                      KeccakF_400_Tests.Test_XOR_No_Data'Access));
      Ret.Add_Test(Caller_400.Create("Keccak-f[400]: Test XOR all bits into the Keccak state", 
                                      KeccakF_400_Tests.Test_XOR_Entire_State'Access));
      Ret.Add_Test(Caller_400.Create("Keccak-f[400]: Test XOR is correct all possible bit-lengths", 
                                      KeccakF_400_Tests.Test_XOR_Bit_Length'Access));
                                 
      Ret.Add_Test(Caller_200.Create("Keccak-f[200]: Test initial Keccak state is zero", 
                                      KeccakF_200_Tests.Test_Initial_State'Access));
      Ret.Add_Test(Caller_200.Create("Keccak-f[200]: Test Extract_Bytes",
                                      KeccakF_200_Tests.Test_Extract_Bytes'Access));
      Ret.Add_Test(Caller_200.Create("Keccak-f[200]: Test XOR 0 bits into the Keccak state", 
                                      KeccakF_200_Tests.Test_XOR_No_Data'Access));
      Ret.Add_Test(Caller_200.Create("Keccak-f[200]: Test XOR all bits into the Keccak state", 
                                      KeccakF_200_Tests.Test_XOR_Entire_State'Access));
      Ret.Add_Test(Caller_200.Create("Keccak-f[200]: Test XOR is correct all possible bit-lengths", 
                                      KeccakF_200_Tests.Test_XOR_Bit_Length'Access));
                                 
      Ret.Add_Test(Caller_100.Create("Keccak-f[100]: Test initial Keccak state is zero", 
                                      KeccakF_100_Tests.Test_Initial_State'Access));
      Ret.Add_Test(Caller_100.Create("Keccak-f[100]: Test Extract_Bytes",
                                      KeccakF_100_Tests.Test_Extract_Bytes'Access));
      Ret.Add_Test(Caller_100.Create("Keccak-f[100]: Test XOR 0 bits into the Keccak state", 
                                      KeccakF_100_Tests.Test_XOR_No_Data'Access));
      Ret.Add_Test(Caller_100.Create("Keccak-f[100]: Test XOR all bits into the Keccak state", 
                                      KeccakF_100_Tests.Test_XOR_Entire_State'Access));
      Ret.Add_Test(Caller_100.Create("Keccak-f[100]: Test XOR is correct all possible bit-lengths", 
                                      KeccakF_100_Tests.Test_XOR_Bit_Length'Access));
                                 
      Ret.Add_Test(Caller_50.Create("Keccak-f[50]: Test initial Keccak state is zero", 
                                     KeccakF_50_Tests.Test_Initial_State'Access));
      Ret.Add_Test(Caller_50.Create("Keccak-f[50]: Test Extract_Bytes",
                                     KeccakF_50_Tests.Test_Extract_Bytes'Access));
      Ret.Add_Test(Caller_50.Create("Keccak-f[50]: Test XOR 0 bits into the Keccak state", 
                                     KeccakF_50_Tests.Test_XOR_No_Data'Access));
      Ret.Add_Test(Caller_50.Create("Keccak-f[50]: Test XOR all bits into the Keccak state", 
                                     KeccakF_50_Tests.Test_XOR_Entire_State'Access));
      Ret.Add_Test(Caller_50.Create("Keccak-f[50]: Test XOR is correct all possible bit-lengths", 
                                     KeccakF_50_Tests.Test_XOR_Bit_Length'Access));
                                 
      Ret.Add_Test(Caller_25.Create("Keccak-f[25]: Test initial Keccak state is zero", 
                                     KeccakF_25_Tests.Test_Initial_State'Access));
      Ret.Add_Test(Caller_25.Create("Keccak-f[25]: Test Extract_Bytes",
                                     KeccakF_25_Tests.Test_Extract_Bytes'Access));
      Ret.Add_Test(Caller_25.Create("Keccak-f[25]: Test XOR 0 bits into the Keccak state", 
                                     KeccakF_25_Tests.Test_XOR_No_Data'Access));
      Ret.Add_Test(Caller_25.Create("Keccak-f[25]: Test XOR all bits into the Keccak state", 
                                     KeccakF_25_Tests.Test_XOR_Entire_State'Access));
      Ret.Add_Test(Caller_25.Create("Keccak-f[25]: Test XOR is correct all possible bit-lengths", 
                                     KeccakF_25_Tests.Test_XOR_Bit_Length'Access));
      
      return Ret;
   end Suite;

end KeccakF_Suite;
