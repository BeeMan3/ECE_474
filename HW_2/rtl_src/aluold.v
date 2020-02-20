/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : L-2016.03-SP2
// Date      : Thu Apr 18 22:00:53 2019
/////////////////////////////////////////////////////////////


module alu_DW01_addsub_0 ( A, B, CI, ADD_SUB, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI, ADD_SUB;
  output CO;

  wire   [9:0] carry;
  wire   [8:0] B_AS;
  assign carry[0] = ADD_SUB;

  FADDX1 U1_7 ( .A(A[7]), .B(B_AS[7]), .CI(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  FADDX1 U1_5 ( .A(A[5]), .B(B_AS[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  FADDX1 U1_6 ( .A(A[6]), .B(B_AS[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  FADDX1 U1_4 ( .A(A[4]), .B(B_AS[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  FADDX1 U1_3 ( .A(A[3]), .B(B_AS[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  FADDX1 U1_2 ( .A(A[2]), .B(B_AS[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  FADDX1 U1_1 ( .A(A[1]), .B(B_AS[1]), .CI(carry[1]), .CO(carry[2]), .S(SUM[1]) );
  FADDX1 U1_0 ( .A(A[0]), .B(B_AS[0]), .CI(carry[0]), .CO(carry[1]), .S(SUM[0]) );
  XOR2X1 U1 ( .IN1(carry[0]), .IN2(carry[8]), .Q(SUM[8]) );
  XOR2X1 U2 ( .IN1(B[7]), .IN2(carry[0]), .Q(B_AS[7]) );
  XOR2X1 U3 ( .IN1(B[6]), .IN2(carry[0]), .Q(B_AS[6]) );
  XOR2X1 U4 ( .IN1(B[5]), .IN2(carry[0]), .Q(B_AS[5]) );
  XOR2X1 U5 ( .IN1(B[4]), .IN2(carry[0]), .Q(B_AS[4]) );
  XOR2X1 U6 ( .IN1(B[3]), .IN2(carry[0]), .Q(B_AS[3]) );
  XOR2X1 U7 ( .IN1(B[2]), .IN2(carry[0]), .Q(B_AS[2]) );
  XOR2X1 U8 ( .IN1(B[1]), .IN2(carry[0]), .Q(B_AS[1]) );
  XOR2X1 U9 ( .IN1(B[0]), .IN2(carry[0]), .Q(B_AS[0]) );
endmodule


module alu ( in_a, in_b, opcode, alu_out, alu_zero, alu_carry );
  input [7:0] in_a;
  input [7:0] in_b;
  input [3:0] opcode;
  output [7:0] alu_out;
  output alu_zero, alu_carry;
  wire   N93, N126, N127, N128, N129, N130, N131, N132, N133, \U3/U1/Z_0 ,
         \U3/U1/Z_1 , \U3/U1/Z_2 , \U3/U1/Z_3 , \U3/U1/Z_4 , \U3/U1/Z_5 ,
         \U3/U1/Z_6 , \U3/U1/Z_7 , \U3/U2/Z_0 , \U3/U2/Z_1 , \U3/U2/Z_2 ,
         \U3/U2/Z_3 , \U3/U2/Z_4 , \U3/U2/Z_5 , \U3/U2/Z_6 , \U3/U2/Z_7 ,
         \U3/U3/Z_0 , n172, n173, n174, n175, n176, n177, n178, n179, n180,
         n181, n182, n183, n184, n185, n186, n187, n188, n189, n190, n191,
         n192, n193, n194, n195, n196, n197, n198, n199, n200, n201, n202,
         n203, n204, n205, n206, n207, n208, n209, n210, n211, n212, n213,
         n214, n215, n216, n217, n218, n219, n220, n221, n222, n223, n224,
         n225, n226, n227, n228, n229, n230, n231, n232, n233, n234, n235,
         n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, n246,
         n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257,
         n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268,
         n269, n270, n271, n272, n273, n274, n275, n276, n277, n278, n279,
         n280, n281, n282, n283, n284, n285, n286, n287, n288, n289, n290,
         n291, n292, n293, n294, n295, n296, n297, n298, n299, n300, n301,
         n302, n303, n304, n305, n306, n307, n308, n309, n310, n311, n312,
         n313, n314, n315, n316, n317, n318, n319, n320, n321, n322, n323;

  alu_DW01_addsub_0 r35 ( .A({1'b0, \U3/U1/Z_7 , \U3/U1/Z_6 , \U3/U1/Z_5 , 
        \U3/U1/Z_4 , \U3/U1/Z_3 , \U3/U1/Z_2 , \U3/U1/Z_1 , \U3/U1/Z_0 }), .B(
        {1'b0, \U3/U2/Z_7 , \U3/U2/Z_6 , \U3/U2/Z_5 , \U3/U2/Z_4 , \U3/U2/Z_3 , 
        \U3/U2/Z_2 , \U3/U2/Z_1 , \U3/U2/Z_0 }), .CI(1'b0), .ADD_SUB(
        \U3/U3/Z_0 ), .SUM({N93, N133, N132, N131, N130, N129, N128, N127, 
        N126}) );
  NAND4X0 U176 ( .IN1(n172), .IN2(n173), .IN3(n174), .IN4(n175), .QN(alu_zero)
         );
  OA221X1 U177 ( .IN1(n176), .IN2(n177), .IN3(in_b[6]), .IN4(n178), .IN5(n179), 
        .Q(n175) );
  NOR2X0 U178 ( .IN1(n180), .IN2(n181), .QN(n178) );
  NOR4X0 U179 ( .IN1(n182), .IN2(n183), .IN3(in_b[3]), .IN4(in_b[2]), .QN(n180) );
  NAND3X0 U180 ( .IN1(n184), .IN2(n185), .IN3(n186), .QN(n183) );
  OR4X1 U181 ( .IN1(n187), .IN2(n188), .IN3(in_b[0]), .IN4(in_b[1]), .Q(n182)
         );
  OA22X1 U182 ( .IN1(n189), .IN2(n190), .IN3(in_a[6]), .IN4(n191), .Q(n174) );
  NOR2X0 U183 ( .IN1(n192), .IN2(n181), .QN(n191) );
  AND4X1 U184 ( .IN1(n193), .IN2(n194), .IN3(n195), .IN4(n196), .Q(n181) );
  AND4X1 U185 ( .IN1(n197), .IN2(n198), .IN3(n199), .IN4(n200), .Q(n196) );
  OA21X1 U186 ( .IN1(n201), .IN2(n185), .IN3(n202), .Q(n195) );
  NOR3X0 U187 ( .IN1(n203), .IN2(in_a[0]), .IN3(n204), .QN(n192) );
  AND2X1 U188 ( .IN1(n205), .IN2(n206), .Q(n189) );
  NAND4X0 U189 ( .IN1(n207), .IN2(n208), .IN3(n209), .IN4(n210), .QN(n173) );
  AND4X1 U190 ( .IN1(n211), .IN2(n212), .IN3(n213), .IN4(n214), .Q(n210) );
  INVX0 U191 ( .IN(n215), .QN(n214) );
  AND3X1 U192 ( .IN1(n216), .IN2(n217), .IN3(n218), .Q(n209) );
  NAND4X0 U193 ( .IN1(n219), .IN2(n220), .IN3(n221), .IN4(n222), .QN(n172) );
  NOR3X0 U194 ( .IN1(N131), .IN2(N133), .IN3(N132), .QN(n222) );
  NAND2X0 U195 ( .IN1(n223), .IN2(n224), .QN(n221) );
  NAND4X0 U196 ( .IN1(n225), .IN2(n226), .IN3(n227), .IN4(n228), .QN(n224) );
  NAND4X0 U197 ( .IN1(n229), .IN2(n226), .IN3(n227), .IN4(n228), .QN(n223) );
  NAND3X0 U198 ( .IN1(n230), .IN2(n231), .IN3(n205), .QN(n229) );
  NAND2X0 U199 ( .IN1(n232), .IN2(n188), .QN(n205) );
  NAND2X0 U200 ( .IN1(n233), .IN2(n234), .QN(alu_out[7]) );
  OA221X1 U201 ( .IN1(n213), .IN2(n215), .IN3(n235), .IN4(n185), .IN5(n236), 
        .Q(n234) );
  OA21X1 U202 ( .IN1(n201), .IN2(n237), .IN3(n187), .Q(n235) );
  AOI21X1 U203 ( .IN1(in_b[7]), .IN2(n201), .IN3(n238), .QN(n213) );
  OA221X1 U204 ( .IN1(n239), .IN2(n203), .IN3(n240), .IN4(n241), .IN5(n242), 
        .Q(n233) );
  MUX21X1 U205 ( .IN1(n177), .IN2(n187), .S(in_a[7]), .Q(n242) );
  INVX0 U206 ( .IN(N133), .QN(n241) );
  NAND4X0 U207 ( .IN1(n243), .IN2(n236), .IN3(n244), .IN4(n245), .QN(
        alu_out[6]) );
  OA221X1 U208 ( .IN1(n201), .IN2(n206), .IN3(n246), .IN4(n203), .IN5(n247), 
        .Q(n245) );
  MUX21X1 U209 ( .IN1(n177), .IN2(n187), .S(in_a[6]), .Q(n247) );
  OA22X1 U210 ( .IN1(n208), .IN2(n215), .IN3(n240), .IN4(n248), .Q(n244) );
  INVX0 U211 ( .IN(N132), .QN(n248) );
  OA21X1 U212 ( .IN1(n249), .IN2(in_a[6]), .IN3(n250), .Q(n208) );
  AO21X1 U213 ( .IN1(n187), .IN2(n251), .IN3(n249), .Q(n243) );
  NAND2X0 U214 ( .IN1(n202), .IN2(in_a[6]), .QN(n251) );
  INVX0 U215 ( .IN(n237), .QN(n202) );
  NAND4X0 U216 ( .IN1(n252), .IN2(n236), .IN3(n253), .IN4(n254), .QN(
        alu_out[5]) );
  OA221X1 U217 ( .IN1(n240), .IN2(n255), .IN3(in_a[5]), .IN4(n177), .IN5(n256), 
        .Q(n254) );
  OA22X1 U218 ( .IN1(n257), .IN2(n203), .IN3(n239), .IN4(n206), .Q(n256) );
  INVX0 U219 ( .IN(in_a[6]), .QN(n239) );
  INVX0 U220 ( .IN(N131), .QN(n255) );
  OA22X1 U221 ( .IN1(n237), .IN2(n193), .IN3(n216), .IN4(n215), .Q(n253) );
  OA21X1 U222 ( .IN1(n184), .IN2(in_a[5]), .IN3(n258), .Q(n216) );
  NAND2X0 U223 ( .IN1(in_b[5]), .IN2(in_a[5]), .QN(n193) );
  AO21X1 U224 ( .IN1(n184), .IN2(n246), .IN3(n187), .Q(n252) );
  NAND4X0 U225 ( .IN1(n259), .IN2(n236), .IN3(n260), .IN4(n261), .QN(
        alu_out[4]) );
  OA221X1 U226 ( .IN1(n240), .IN2(n220), .IN3(in_a[4]), .IN4(n177), .IN5(n262), 
        .Q(n261) );
  OA22X1 U227 ( .IN1(n263), .IN2(n203), .IN3(n246), .IN4(n206), .Q(n262) );
  INVX0 U228 ( .IN(N130), .QN(n220) );
  OA22X1 U229 ( .IN1(n212), .IN2(n215), .IN3(n237), .IN4(n200), .Q(n260) );
  NAND2X0 U230 ( .IN1(in_b[4]), .IN2(in_a[4]), .QN(n200) );
  OA21X1 U231 ( .IN1(n186), .IN2(in_a[4]), .IN3(n264), .Q(n212) );
  AO21X1 U232 ( .IN1(n186), .IN2(n257), .IN3(n187), .Q(n259) );
  NAND4X0 U233 ( .IN1(n265), .IN2(n236), .IN3(n266), .IN4(n267), .QN(
        alu_out[3]) );
  OA221X1 U234 ( .IN1(n240), .IN2(n219), .IN3(in_a[3]), .IN4(n177), .IN5(n268), 
        .Q(n267) );
  OA22X1 U235 ( .IN1(n269), .IN2(n203), .IN3(n257), .IN4(n206), .Q(n268) );
  INVX0 U236 ( .IN(N129), .QN(n219) );
  OA22X1 U237 ( .IN1(n211), .IN2(n215), .IN3(n237), .IN4(n194), .Q(n266) );
  NAND2X0 U238 ( .IN1(in_b[3]), .IN2(in_a[3]), .QN(n194) );
  OA21X1 U239 ( .IN1(n270), .IN2(in_a[3]), .IN3(n271), .Q(n211) );
  AO21X1 U240 ( .IN1(n270), .IN2(n263), .IN3(n187), .Q(n265) );
  NAND4X0 U241 ( .IN1(n272), .IN2(n236), .IN3(n273), .IN4(n274), .QN(
        alu_out[2]) );
  OA221X1 U242 ( .IN1(n240), .IN2(n228), .IN3(in_a[2]), .IN4(n177), .IN5(n275), 
        .Q(n274) );
  OA22X1 U243 ( .IN1(n276), .IN2(n203), .IN3(n263), .IN4(n206), .Q(n275) );
  INVX0 U244 ( .IN(N128), .QN(n228) );
  OA22X1 U245 ( .IN1(n218), .IN2(n215), .IN3(n237), .IN4(n197), .Q(n273) );
  NAND2X0 U246 ( .IN1(in_b[2]), .IN2(in_a[2]), .QN(n197) );
  XOR2X1 U247 ( .IN1(in_b[2]), .IN2(n269), .Q(n218) );
  AO21X1 U248 ( .IN1(n277), .IN2(n269), .IN3(n187), .Q(n272) );
  NAND4X0 U249 ( .IN1(n278), .IN2(n236), .IN3(n279), .IN4(n280), .QN(
        alu_out[1]) );
  OA221X1 U250 ( .IN1(n240), .IN2(n227), .IN3(in_a[1]), .IN4(n177), .IN5(n281), 
        .Q(n280) );
  OA22X1 U251 ( .IN1(n282), .IN2(n203), .IN3(n269), .IN4(n206), .Q(n281) );
  INVX0 U252 ( .IN(N127), .QN(n227) );
  OA22X1 U253 ( .IN1(n217), .IN2(n215), .IN3(n237), .IN4(n198), .Q(n279) );
  NAND2X0 U254 ( .IN1(in_b[1]), .IN2(in_a[1]), .QN(n198) );
  XOR2X1 U255 ( .IN1(in_b[1]), .IN2(n276), .Q(n217) );
  AO21X1 U256 ( .IN1(n283), .IN2(n276), .IN3(n187), .Q(n278) );
  NAND4X0 U257 ( .IN1(n284), .IN2(n236), .IN3(n285), .IN4(n286), .QN(
        alu_out[0]) );
  OA222X1 U258 ( .IN1(n276), .IN2(n206), .IN3(in_a[0]), .IN4(n177), .IN5(n240), 
        .IN6(n226), .Q(n286) );
  INVX0 U259 ( .IN(N126), .QN(n226) );
  NOR2X0 U260 ( .IN1(n287), .IN2(n288), .QN(n240) );
  NAND3X0 U261 ( .IN1(opcode[1]), .IN2(n289), .IN3(n290), .QN(n177) );
  OA22X1 U262 ( .IN1(n207), .IN2(n215), .IN3(n237), .IN4(n199), .Q(n285) );
  NAND2X0 U263 ( .IN1(in_b[0]), .IN2(in_a[0]), .QN(n199) );
  NAND4X0 U264 ( .IN1(opcode[2]), .IN2(opcode[1]), .IN3(n289), .IN4(n291), 
        .QN(n237) );
  NAND3X0 U265 ( .IN1(opcode[1]), .IN2(n292), .IN3(opcode[2]), .QN(n215) );
  OA21X1 U266 ( .IN1(n282), .IN2(in_b[0]), .IN3(n293), .Q(n207) );
  AO21X1 U267 ( .IN1(n294), .IN2(n282), .IN3(n187), .Q(n284) );
  NAND3X0 U268 ( .IN1(n292), .IN2(n295), .IN3(opcode[2]), .QN(n187) );
  INVX0 U269 ( .IN(in_b[0]), .QN(n294) );
  NAND4X0 U270 ( .IN1(n296), .IN2(n297), .IN3(n179), .IN4(n298), .QN(alu_carry) );
  OA221X1 U271 ( .IN1(n201), .IN2(n203), .IN3(n299), .IN4(n300), .IN5(n236), 
        .Q(n298) );
  NAND2X0 U272 ( .IN1(n232), .IN2(n301), .QN(n236) );
  OA22X1 U273 ( .IN1(n238), .IN2(n302), .IN3(in_a[7]), .IN4(n185), .Q(n299) );
  OA22X1 U274 ( .IN1(n303), .IN2(n304), .IN3(in_a[6]), .IN4(n249), .Q(n302) );
  NAND2X0 U275 ( .IN1(n258), .IN2(n250), .QN(n304) );
  NAND2X0 U276 ( .IN1(in_a[6]), .IN2(n249), .QN(n250) );
  NAND2X0 U277 ( .IN1(in_a[5]), .IN2(n184), .QN(n258) );
  OA221X1 U278 ( .IN1(in_a[5]), .IN2(n184), .IN3(in_a[4]), .IN4(n186), .IN5(
        n305), .Q(n303) );
  NAND3X0 U279 ( .IN1(n271), .IN2(n264), .IN3(n306), .QN(n305) );
  AO222X1 U280 ( .IN1(n307), .IN2(n269), .IN3(in_b[2]), .IN4(n308), .IN5(
        in_b[3]), .IN6(n263), .Q(n306) );
  NAND2X0 U281 ( .IN1(n309), .IN2(in_a[2]), .QN(n308) );
  INVX0 U282 ( .IN(n309), .QN(n307) );
  OA22X1 U283 ( .IN1(n293), .IN2(in_a[1]), .IN3(n283), .IN4(n310), .Q(n309) );
  AND2X1 U284 ( .IN1(in_a[1]), .IN2(n293), .Q(n310) );
  NAND2X0 U285 ( .IN1(in_b[0]), .IN2(n282), .QN(n293) );
  NAND2X0 U286 ( .IN1(in_a[4]), .IN2(n186), .QN(n264) );
  NAND2X0 U287 ( .IN1(in_a[3]), .IN2(n270), .QN(n271) );
  NOR2X0 U288 ( .IN1(n201), .IN2(in_b[7]), .QN(n238) );
  NAND3X0 U289 ( .IN1(opcode[0]), .IN2(n295), .IN3(n290), .QN(n203) );
  INVX0 U290 ( .IN(in_a[7]), .QN(n201) );
  OA22X1 U291 ( .IN1(n231), .IN2(n188), .IN3(n176), .IN4(n230), .Q(n179) );
  OR2X1 U292 ( .IN1(n206), .IN2(n282), .Q(n297) );
  NAND3X0 U293 ( .IN1(n289), .IN2(n295), .IN3(n290), .QN(n206) );
  NAND2X0 U294 ( .IN1(N93), .IN2(n311), .QN(n296) );
  INVX0 U295 ( .IN(n312), .QN(n311) );
  INVX0 U296 ( .IN(n313), .QN(\U3/U3/Z_0 ) );
  NOR2X0 U297 ( .IN1(n314), .IN2(n185), .QN(\U3/U2/Z_7 ) );
  INVX0 U298 ( .IN(in_b[7]), .QN(n185) );
  NOR2X0 U299 ( .IN1(n314), .IN2(n249), .QN(\U3/U2/Z_6 ) );
  INVX0 U300 ( .IN(in_b[6]), .QN(n249) );
  NOR2X0 U301 ( .IN1(n314), .IN2(n184), .QN(\U3/U2/Z_5 ) );
  INVX0 U302 ( .IN(in_b[5]), .QN(n184) );
  NOR2X0 U303 ( .IN1(n314), .IN2(n186), .QN(\U3/U2/Z_4 ) );
  INVX0 U304 ( .IN(in_b[4]), .QN(n186) );
  NOR2X0 U305 ( .IN1(n314), .IN2(n270), .QN(\U3/U2/Z_3 ) );
  INVX0 U306 ( .IN(in_b[3]), .QN(n270) );
  NOR2X0 U307 ( .IN1(n314), .IN2(n277), .QN(\U3/U2/Z_2 ) );
  INVX0 U308 ( .IN(in_b[2]), .QN(n277) );
  NOR2X0 U309 ( .IN1(n314), .IN2(n283), .QN(\U3/U2/Z_1 ) );
  INVX0 U310 ( .IN(in_b[1]), .QN(n283) );
  INVX0 U311 ( .IN(n225), .QN(n314) );
  AO221X1 U312 ( .IN1(n232), .IN2(n190), .IN3(n315), .IN4(n176), .IN5(n316), 
        .Q(\U3/U2/Z_0 ) );
  AO21X1 U313 ( .IN1(in_b[0]), .IN2(n225), .IN3(n288), .Q(n316) );
  NAND2X0 U314 ( .IN1(n300), .IN2(n312), .QN(n225) );
  INVX0 U315 ( .IN(n317), .QN(n190) );
  INVX0 U316 ( .IN(n318), .QN(n232) );
  MUX21X1 U317 ( .IN1(n288), .IN2(n287), .S(in_a[7]), .Q(\U3/U1/Z_7 ) );
  MUX21X1 U318 ( .IN1(n288), .IN2(n287), .S(in_a[6]), .Q(\U3/U1/Z_6 ) );
  MUX21X1 U319 ( .IN1(n288), .IN2(n287), .S(in_a[5]), .Q(\U3/U1/Z_5 ) );
  MUX21X1 U320 ( .IN1(n288), .IN2(n287), .S(in_a[4]), .Q(\U3/U1/Z_4 ) );
  MUX21X1 U321 ( .IN1(n288), .IN2(n287), .S(in_a[3]), .Q(\U3/U1/Z_3 ) );
  MUX21X1 U322 ( .IN1(n288), .IN2(n287), .S(in_a[2]), .Q(\U3/U1/Z_2 ) );
  MUX21X1 U323 ( .IN1(n288), .IN2(n287), .S(in_a[1]), .Q(\U3/U1/Z_1 ) );
  MUX21X1 U324 ( .IN1(n288), .IN2(n287), .S(in_a[0]), .Q(\U3/U1/Z_0 ) );
  NAND3X0 U325 ( .IN1(n312), .IN2(n313), .IN3(n319), .QN(n287) );
  NAND2X0 U326 ( .IN1(n315), .IN2(n176), .QN(n319) );
  NAND4X0 U327 ( .IN1(in_a[7]), .IN2(in_a[6]), .IN3(n320), .IN4(n321), .QN(
        n176) );
  NOR4X0 U328 ( .IN1(n282), .IN2(n276), .IN3(n269), .IN4(n263), .QN(n321) );
  NOR2X0 U329 ( .IN1(n257), .IN2(n246), .QN(n320) );
  INVX0 U330 ( .IN(in_a[5]), .QN(n246) );
  INVX0 U331 ( .IN(in_a[4]), .QN(n257) );
  INVX0 U332 ( .IN(n230), .QN(n315) );
  NAND3X0 U333 ( .IN1(n292), .IN2(n322), .IN3(opcode[1]), .QN(n230) );
  OA21X1 U334 ( .IN1(n318), .IN2(n317), .IN3(n300), .Q(n313) );
  NAND4X0 U335 ( .IN1(opcode[1]), .IN2(n289), .IN3(n322), .IN4(n291), .QN(n300) );
  NAND4X0 U336 ( .IN1(opcode[2]), .IN2(n289), .IN3(n295), .IN4(n291), .QN(n318) );
  NAND3X0 U337 ( .IN1(n295), .IN2(n322), .IN3(n292), .QN(n312) );
  NOR2X0 U338 ( .IN1(n289), .IN2(opcode[3]), .QN(n292) );
  INVX0 U339 ( .IN(opcode[0]), .QN(n289) );
  INVX0 U340 ( .IN(opcode[2]), .QN(n322) );
  INVX0 U341 ( .IN(opcode[1]), .QN(n295) );
  NOR2X0 U342 ( .IN1(n231), .IN2(n301), .QN(n288) );
  INVX0 U343 ( .IN(n188), .QN(n301) );
  NAND2X0 U344 ( .IN1(n317), .IN2(n282), .QN(n188) );
  INVX0 U345 ( .IN(in_a[0]), .QN(n282) );
  NOR3X0 U346 ( .IN1(in_a[6]), .IN2(in_a[7]), .IN3(n204), .QN(n317) );
  NAND4X0 U347 ( .IN1(n276), .IN2(n269), .IN3(n323), .IN4(n263), .QN(n204) );
  INVX0 U348 ( .IN(in_a[3]), .QN(n263) );
  NOR2X0 U349 ( .IN1(in_a[5]), .IN2(in_a[4]), .QN(n323) );
  INVX0 U350 ( .IN(in_a[2]), .QN(n269) );
  INVX0 U351 ( .IN(in_a[1]), .QN(n276) );
  NAND3X0 U352 ( .IN1(opcode[1]), .IN2(opcode[0]), .IN3(n290), .QN(n231) );
  NOR2X0 U353 ( .IN1(n291), .IN2(opcode[2]), .QN(n290) );
  INVX0 U354 ( .IN(opcode[3]), .QN(n291) );
endmodule

