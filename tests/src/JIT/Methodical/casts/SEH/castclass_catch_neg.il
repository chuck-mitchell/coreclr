// Copyright (c) Microsoft. All rights reserved.
// Licensed under the MIT license. See LICENSE file in the project root for full license information.

// castclass_catch_neg.il
.assembly extern mscorlib { }
.assembly extern System.Console
{
  .publickeytoken = (B0 3F 5F 7F 11 D5 0A 3A )
  .ver 4:0:0:0
}
.assembly castclass_catch_neg { }
.namespace JitTest
{
  .class private auto ansi beforefieldinit Test
         extends [mscorlib]System.Object
  {
    .method private hidebysig static int32
            Main() cil managed
    {
      .entrypoint
      .maxstack  3
      .locals (int32 V_0,
               int32 V_1,
               class [mscorlib]System.Exception V_2,
               class [mscorlib]System.ApplicationException V_3,
               int32 V_4)
      .try
      {
        .try
        {
          IL_0000:  ldc.i4.5
          IL_0001:  stloc.0
          IL_0002:  ldloc.0
          IL_0003:  stloc.1
          IL_0004:  ldloc.0
          IL_0005:  ldloc.1
          IL_0006:  ldloc.0
          IL_0007:  sub
          IL_0008:  div
          IL_0009:  call       void [System.Console]System.Console::WriteLine(int32)
          IL_000e:  ldstr      "failed (1)"
          IL_0013:  call       void [System.Console]System.Console::WriteLine(string)
          IL_0018:  ldc.i4.s   101
          IL_001a:  stloc.s    V_4
          IL_001c:  leave.s    IL_004d
        }
        catch [mscorlib]System.Exception 
        {
          IL_0020:  castclass  [mscorlib]System.ApplicationException
          IL_0027:  call       void [System.Console]System.Console::WriteLine(object)
          IL_002c:  ldstr      "failed (2)"
          IL_0031:  call       void [System.Console]System.Console::WriteLine(string)
          IL_0036:  ldc.i4.s   102
          IL_0038:  stloc.s    V_4
          IL_003a:  leave.s    IL_004d
        }
      }
      catch [mscorlib]System.InvalidCastException 
      {
        IL_003c:  pop
        IL_003d:  ldstr      "*** TEST PASSED ***"
        IL_0042:  call       void [System.Console]System.Console::WriteLine(string)
        IL_0047:  ldc.i4.s   100
        IL_0049:  stloc.s    V_4
        IL_004b:  leave.s    IL_004d
      }
      IL_004d:  ldloc.s    V_4
      IL_004f:  ret
    }
    .method public hidebysig specialname rtspecialname 
            instance void .ctor() cil managed
    {
      .maxstack  8
      IL_0000:  ldarg.0
      IL_0001:  call       instance void [mscorlib]System.Object::.ctor()
      IL_0006:  ret
    }
  }
}
