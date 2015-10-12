(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 10.2' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc. For additional information concerning CDF     *)
(*  licensing and redistribution see:                                    *)
(*                                                                       *)
(*        www.wolfram.com/cdf/adopting-cdf/licensing-options.html        *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1064,         20]
NotebookDataLength[    278972,       5074]
NotebookOptionsPosition[    278311,       5028]
NotebookOutlinePosition[    278744,       5047]
CellTagsIndexPosition[    278701,       5044]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell["Median Filter Tests for Dominik", "Title"],

Cell["To clarify my image of how to proceed in week of 2015.10 .12", "Text"],

Cell[CellGroupData[{

Cell["Plot filter results", "Section"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", 
   RowBox[{"Example", " ", "use", " ", "of", " ", 
    RowBox[{"Partition", "[", "]"}], " ", "function"}], "*)"}], 
  "\[IndentingNewLine]", 
  RowBox[{"Partition", "[", 
   RowBox[{
    RowBox[{"Range", "[", "10", "]"}], ",", " ", "5", ",", " ", "1"}], 
   "]"}]}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{
   RowBox[{"{", 
    RowBox[{"1", ",", "2", ",", "3", ",", "4", ",", "5"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"2", ",", "3", ",", "4", ",", "5", ",", "6"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"3", ",", "4", ",", "5", ",", "6", ",", "7"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"4", ",", "5", ",", "6", ",", "7", ",", "8"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"5", ",", "6", ",", "7", ",", "8", ",", "9"}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{"6", ",", "7", ",", "8", ",", "9", ",", "10"}], "}"}]}], 
  "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"(*", 
   RowBox[{
   "Simple", " ", "and", " ", "inefficient", " ", "implementation", " ", "of",
     " ", "median", " ", "filter"}], "*)"}], "\[IndentingNewLine]", 
  RowBox[{"(*", 
   RowBox[{"Actually", ",", " ", 
    RowBox[{
    "the", " ", "median", " ", "filter", " ", "will", " ", "only", " ", 
     "really", " ", "work", " ", "for", " ", "odd", " ", "window", " ", 
     RowBox[{"lengths", "."}]}]}], "*)"}], "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{
     RowBox[{"slidingMedian", "[", 
      RowBox[{"data_List", ",", " ", 
       RowBox[{"windowLength_", "/;", 
        RowBox[{"OddQ", "[", "windowLength", "]"}]}]}], "]"}], ":=", " ", 
     RowBox[{"Median", " ", "/@", " ", 
      RowBox[{"Partition", "[", 
       RowBox[{"data", ",", " ", "windowLength", ",", " ", "1"}], "]"}]}]}], 
    ";"}], "\[IndentingNewLine]", "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{
     RowBox[{"sinWaveMedianFilterPlottingData", "[", 
      RowBox[{"oneCycleLength_", ",", " ", 
       RowBox[{"windowLength_", "/;", 
        RowBox[{"OddQ", "[", "windowLength", "]"}]}]}], "]"}], ":=", 
     "\[IndentingNewLine]", 
     RowBox[{"Module", "[", 
      RowBox[{
       RowBox[{"{", 
        RowBox[{
        "data", ",", "delayPoints", ",", "tempData", ",", " ", 
         "slidingMedianData"}], "}"}], ",", "\[IndentingNewLine]", 
       "\[IndentingNewLine]", 
       RowBox[{
        RowBox[{"data", "=", 
         RowBox[{"Table", "[", 
          RowBox[{
           RowBox[{"N", "[", 
            RowBox[{"Sin", "[", 
             RowBox[{
              RowBox[{"x", "/", "oneCycleLength"}], "*", " ", "2", " ", 
              "Pi"}], "]"}], "]"}], ",", " ", 
           RowBox[{"{", 
            RowBox[{"x", ",", " ", "0", ",", " ", 
             RowBox[{"oneCycleLength", "*", "10"}]}], "}"}]}], "]"}]}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{"delayPoints", "=", 
         RowBox[{"Floor", "[", 
          RowBox[{"windowLength", "/", "2"}], "]"}]}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{"slidingMedianData", " ", "=", " ", 
         RowBox[{"slidingMedian", "[", 
          RowBox[{"data", ",", " ", "windowLength"}], "]"}]}], ";", 
        "\[IndentingNewLine]", "\[IndentingNewLine]", 
        RowBox[{"(*", 
         RowBox[{
         "Cut", " ", "partial", " ", "cycle", " ", "at", " ", "beginning", 
          " ", "and", " ", "end", " ", "of", " ", "sliding", " ", "Median", 
          " ", "data", " ", "to", " ", "compensate", " ", "for", " ", 
          RowBox[{"delays", ".", " ", "Mathematica"}], " ", "indexing", " ", 
          "starts", " ", "at", " ", 
          RowBox[{"one", "!"}]}], " ", "*)"}], "\[IndentingNewLine]", 
        RowBox[{"slidingMedianData", " ", "=", " ", "\[IndentingNewLine]", 
         RowBox[{"slidingMedianData", "[", 
          RowBox[{"[", 
           RowBox[{
            RowBox[{
             RowBox[{"(", 
              RowBox[{"oneCycleLength", "-", "delayPoints"}], ")"}], "+", 
             "1"}], ";;", "  ", 
            RowBox[{
             RowBox[{"-", " ", "oneCycleLength"}], " ", "+", " ", 
             "delayPoints", "-", "1"}]}], " ", "]"}], "]"}]}], ";", 
        "\[IndentingNewLine]", 
        RowBox[{"(*", 
         RowBox[{
         "Cut", " ", "off", " ", "first", " ", "cycle", " ", "from", " ", 
          "original", " ", "data"}], "*)"}], "\[IndentingNewLine]", 
        RowBox[{"tempData", "=", 
         RowBox[{"data", "[", 
          RowBox[{"[", "  ", 
           RowBox[{
            RowBox[{"oneCycleLength", " ", "+", " ", "1"}], " ", ";;", 
            RowBox[{"oneCycleLength", " ", "+", " ", 
             RowBox[{"Length", "[", "slidingMedianData", "]"}]}]}], " ", 
           "]"}], "]"}]}], ";", "  ", "\[IndentingNewLine]", 
        "\[IndentingNewLine]", 
        RowBox[{"(*", 
         RowBox[{
          RowBox[{
          "return", " ", "the", " ", "cut", " ", "original", " ", "data"}], 
          ",", " ", 
          RowBox[{
          "the", " ", "cut", " ", "sliding", " ", "median", " ", "data"}], 
          ",", " ", 
          RowBox[{
          "and", " ", "the", " ", "median", " ", "filtered", " ", 
           "result"}]}], "*)"}], "\[IndentingNewLine]", 
        RowBox[{"{", 
         RowBox[{"tempData", ",", " ", "slidingMedianData", ",", " ", 
          RowBox[{"tempData", "-", "slidingMedianData"}]}], "}"}]}]}], 
      "\[IndentingNewLine]", "]"}]}], ";"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ListLinePlot", "[", 
  RowBox[{
   RowBox[{"sinWaveMedianFilterPlottingData", "[", 
    RowBox[{"10", ",", " ", "5"}], "]"}], ",", " ", 
   RowBox[{"AspectRatio", "\[Rule]", 
    RowBox[{"1", "/", "3"}]}], ",", " ", 
   RowBox[{"ImageSize", "\[Rule]", 
    RowBox[{"72", "*", "10"}]}], ",", " ", 
   RowBox[{"PlotLegends", "\[Rule]", "Automatic"}], ",", " ", 
   RowBox[{"PlotStyle", "\[Rule]", 
    RowBox[{"{", 
     RowBox[{
      RowBox[{"Directive", "[", 
       RowBox[{"Black", ",", "Thin"}], "]"}], ",", 
      RowBox[{"Directive", "[", 
       RowBox[{
        RowBox[{"Thickness", "[", "0.01", "]"}], ",", " ", 
        RowBox[{"Opacity", "[", 
         RowBox[{"0.5", ",", " ", "Black"}], "]"}]}], "]"}], ",", " ", 
      RowBox[{"Directive", "[", "Red", "]"}]}], "}"}]}]}], "]"}]], "Input"],

Cell[BoxData[
 TemplateBox[{GraphicsBox[{{}, {{{}, {}, {
        Hue[0.67, 0.6, 0.6], 
        Directive[
         PointSize[0.01388888888888889], 
         AbsoluteThickness[1.6], 
         GrayLevel[0], 
         Thickness[Tiny]], 
        LineBox[CompressedData["
1:eJxdkD1OAmEURV8MBZUhgYLCQsUQY4wRRQEVeeDwjzB/FQUFCTUV/bczZwfu
wQUYdqAYBpN3vmQyOTN37j2Zs+U6XB2JSLC7/u77s22JPbqYbzKlz6/0eVZ/
Yi9/vP5OOQcuIF9UW3dyeP+x59PD9ymfgy+QL6PvEntX8LkG3yB/i74K9u7g
cw+uIv+Avkfs1eBTBzeQf0LfM/Ze4NMEvyLfQp/aPafwaVt2bfh1bJ/rYO/N
+jiweDbvPPh14deFXw9+Pfj14deH3wB+YBnCbwi/EfxG8BvDbwy/Cfwm8HuH
H1im8JvCbwa/Gfx8y+oj79u+xIdfYH0U7AKbTwL4hXZPQ/wvcIK8RLZPI/yP
yPokYIltXuP/vl8Sphw9
         "]]}, {
        Hue[0.9060679774997897, 0.6, 0.6], 
        Directive[
         PointSize[0.01388888888888889], 
         AbsoluteThickness[1.6], 
         Thickness[0.01], 
         GrayLevel[0], 
         Opacity[0.5]], 
        LineBox[CompressedData["
1:eJxdzjtKA2EUBeCLWFhaWFhY+EJERHy/Y8YYjdEYZ5JUFhaCtZX9vzNnB+7B
FbgElajwfwPD8M2Fc87C08vgeSIiqu/35zt+PpuRP8Xjw+vk0vvH7/8pPI1n
8GyRx8393d/GnseLeBmvkLdK3xpexxt4k7wt+rbxDt7Fe+Tt03eAD/ERPibv
hL5T3MBnuElekfclHOfccbTyvNSi7yJ3wtHm3mbfJf04rrjj6LCvQ/81/Ti6
3Lvsu6Efxy13HD329ei/ox9Hn3uffff04yhzFziVeV5d0l/lLnDCdcW+Af04
4RrHMM8rhvTjGseI/aP/vC+9bBo9
         "]]}, {
        Hue[0.1421359549995791, 0.6, 0.6], 
        Directive[
         PointSize[0.01388888888888889], 
         AbsoluteThickness[1.6], 
         RGBColor[1, 0, 0]], 
        LineBox[CompressedData["
1:eJxd0EtKA0EUBdCHI4cOHDhQUBEREfH/N12JJmqiJt1xBYJjt9AbcS32KnQb
TpyrRJE6BU1zqHvhUkuPz9XTVESU39/Pf3I+ishPyjmdOp8vC2/F+29uBs+S
n8PzePGv/zrxMl4hv4rX8Dp7NvAm+S28jXfYs4v3yO/jA3zIniN8TP4En+Iz
9pzjFvkCp9x1Yk87d92m36GP4yLfU+O4pI+jy32XfT329ehf0cdxzT4cN/Rx
9Lnvs2/AvgH9W/o47tiH454+jiH3Q/aNcqcRedzgKPM9CdclfRxV7lTxXrgh
H2P6uB7nexocD/T//QU8ccSu
         "]]}}}, {}}, {DisplayFunction -> Identity, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, AxesOrigin -> {0, 0}, 
     PlotRange -> {{0., 81.}, {-0.9510565162951535, 0.9510565162951535}}, 
     DisplayFunction -> Identity, AspectRatio -> NCache[
       Rational[1, 3], 0.3333333333333333], Axes -> {True, True}, 
     AxesLabel -> {None, None}, AxesOrigin -> {0, 0}, DisplayFunction :> 
     Identity, Frame -> {{False, False}, {False, False}}, 
     FrameLabel -> {{None, None}, {None, None}}, 
     FrameTicks -> {{Automatic, Automatic}, {Automatic, Automatic}}, 
     GridLines -> {None, None}, GridLinesStyle -> Directive[
       GrayLevel[0.5, 0.4]], ImageSize -> 720, Method -> {}, 
     PlotRange -> {{0., 81.}, {-0.9510565162951535, 0.9510565162951535}}, 
     PlotRangeClipping -> True, PlotRangePadding -> {{
        Scaled[0.02], 
        Scaled[0.02]}, {
        Scaled[0.05], 
        Scaled[0.05]}}, Ticks -> {Automatic, Automatic}}],FormBox[
    FormBox[
     TemplateBox[{
       TagBox[
        FrameBox[
         StyleBox["1", Smaller, StripOnInput -> False]], "Placeholder"], 
       TagBox[
        FrameBox[
         StyleBox["2", Smaller, StripOnInput -> False]], "Placeholder"], 
       TagBox[
        FrameBox[
         StyleBox["3", Smaller, StripOnInput -> False]], "Placeholder"]}, 
      "LineLegend", DisplayFunction -> (FormBox[
        StyleBox[
         StyleBox[
          PaneBox[
           TagBox[
            GridBox[{{
               TagBox[
                GridBox[{{
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.25], 
                    AbsoluteThickness[1.6], 
                    GrayLevel[0], 
                    Thickness[Tiny]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.25], 
                    AbsoluteThickness[1.6], 
                    GrayLevel[0], 
                    Thickness[Tiny]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.25], 
                    AbsoluteThickness[1.6], 
                    Thickness[0.18], 
                    GrayLevel[0], 
                    Opacity[0.5]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.25], 
                    AbsoluteThickness[1.6], 
                    Thickness[0.18], 
                    GrayLevel[0], 
                    Opacity[0.5]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #2}, {
                   GraphicsBox[{{
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.25], 
                    AbsoluteThickness[1.6], 
                    RGBColor[1, 0, 0]], {
                    LineBox[{{0, 10}, {20, 10}}]}}, {
                    Directive[
                    EdgeForm[
                    Directive[
                    Opacity[0.3], 
                    GrayLevel[0]]], 
                    PointSize[0.25], 
                    AbsoluteThickness[1.6], 
                    RGBColor[1, 0, 0]], {}}}, AspectRatio -> Full, 
                    ImageSize -> {20, 10}, PlotRangePadding -> None, 
                    ImagePadding -> Automatic, 
                    BaselinePosition -> (Scaled[0.1] -> Baseline)], #3}}, 
                 GridBoxAlignment -> {
                  "Columns" -> {Center, Left}, "Rows" -> {{Baseline}}}, 
                 AutoDelete -> False, 
                 GridBoxDividers -> {
                  "Columns" -> {{False}}, "Rows" -> {{False}}}, 
                 GridBoxItemSize -> {"Columns" -> {{All}}, "Rows" -> {{All}}},
                  GridBoxSpacings -> {
                  "Columns" -> {{0.5}}, "Rows" -> {{0.8}}}], "Grid"]}}, 
             GridBoxAlignment -> {"Columns" -> {{Left}}, "Rows" -> {{Top}}}, 
             AutoDelete -> False, 
             GridBoxItemSize -> {
              "Columns" -> {{Automatic}}, "Rows" -> {{Automatic}}}, 
             GridBoxSpacings -> {"Columns" -> {{1}}, "Rows" -> {{0}}}], 
            "Grid"], Alignment -> Left, AppearanceElements -> None, 
           ImageMargins -> {{5, 5}, {5, 5}}, ImageSizeAction -> 
           "ResizeToFit"], LineIndent -> 0, StripOnInput -> False], {
         FontFamily -> "Arial"}, Background -> Automatic, StripOnInput -> 
         False], TraditionalForm]& ), 
      InterpretationFunction :> (RowBox[{"LineLegend", "[", 
         RowBox[{
           RowBox[{"{", 
             RowBox[{
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.01388888888888889`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[0], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> GrayLevel[0.], FrameTicks -> None, 
                    PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], "GrayLevel[0]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[0]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[0], Editable -> False, Selectable -> False], 
                   ",", 
                   RowBox[{"Thickness", "[", "Tiny", "]"}]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.01388888888888889`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   RowBox[{"Thickness", "[", "0.01`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    GrayLevel[0], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> GrayLevel[0.], FrameTicks -> None, 
                    PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], "GrayLevel[0]"], Appearance -> None, 
                    BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    GrayLevel[0]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["GrayLevelColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    GrayLevel[0], Editable -> False, Selectable -> False], 
                   ",", 
                   RowBox[{"Opacity", "[", "0.5`", "]"}]}], "]"}], ",", 
               RowBox[{"Directive", "[", 
                 RowBox[{
                   RowBox[{"PointSize", "[", "0.01388888888888889`", "]"}], 
                   ",", 
                   RowBox[{"AbsoluteThickness", "[", "1.6`", "]"}], ",", 
                   InterpretationBox[
                    ButtonBox[
                    TooltipBox[
                    GraphicsBox[{{
                    GrayLevel[0], 
                    RectangleBox[{0, 0}]}, {
                    GrayLevel[0], 
                    RectangleBox[{1, -1}]}, {
                    RGBColor[1, 0, 0], 
                    RectangleBox[{0, -1}, {2, 1}]}}, AspectRatio -> 1, Frame -> 
                    True, FrameStyle -> RGBColor[0.6666666666666666, 0., 0.], 
                    FrameTicks -> None, PlotRangePadding -> None, ImageSize -> 
                    Dynamic[{
                    Automatic, 
                    1.35 (CurrentValue["FontCapHeight"]/AbsoluteCurrentValue[
                    Magnification])}]], "RGBColor[1, 0, 0]"], Appearance -> 
                    None, BaseStyle -> {}, BaselinePosition -> Baseline, 
                    DefaultBaseStyle -> {}, ButtonFunction :> 
                    With[{Typeset`box$ = EvaluationBox[]}, 
                    If[
                    Not[
                    AbsoluteCurrentValue["Deployed"]], 
                    SelectionMove[Typeset`box$, All, Expression]; 
                    FrontEnd`Private`$ColorSelectorInitialAlpha = 1; 
                    FrontEnd`Private`$ColorSelectorInitialColor = 
                    RGBColor[1, 0, 0]; 
                    FrontEnd`Private`$ColorSelectorUseMakeBoxes = True; 
                    MathLink`CallFrontEnd[
                    FrontEnd`AttachCell[Typeset`box$, 
                    FrontEndResource["RGBColorValueSelector"], {
                    0, {Left, Bottom}}, {Left, Top}, 
                    "ClosingActions" -> {
                    "SelectionDeparture", "ParentChanged", 
                    "EvaluatorQuit"}]]]], BaseStyle -> Inherited, Evaluator -> 
                    Automatic, Method -> "Preemptive"], 
                    RGBColor[1, 0, 0], Editable -> False, Selectable -> 
                    False]}], "]"}]}], "}"}], ",", 
           RowBox[{"{", 
             RowBox[{
               TagBox[#, HoldForm], ",", 
               TagBox[#2, HoldForm], ",", 
               TagBox[#3, HoldForm]}], "}"}], ",", 
           RowBox[{"LegendMarkers", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}], ",", 
                 RowBox[{"{", 
                   RowBox[{"False", ",", "Automatic"}], "}"}]}], "}"}]}], ",", 
           RowBox[{"Joined", "\[Rule]", 
             RowBox[{"{", 
               RowBox[{"True", ",", "True", ",", "True"}], "}"}]}], ",", 
           RowBox[{"LabelStyle", "\[Rule]", 
             RowBox[{"{", "}"}]}], ",", 
           RowBox[{"LegendLayout", "\[Rule]", "\"Column\""}]}], "]"}]& ), 
      Editable -> True], TraditionalForm], TraditionalForm]},
  "Legended",
  DisplayFunction->(GridBox[{{
      TagBox[
       ItemBox[
        PaneBox[
         TagBox[#, "SkipImageSizeLevel"], Alignment -> {Center, Baseline}, 
         BaselinePosition -> Baseline], DefaultBaseStyle -> "Labeled"], 
       "SkipImageSizeLevel"], 
      ItemBox[#2, DefaultBaseStyle -> "LabeledLabel"]}}, 
    GridBoxAlignment -> {"Columns" -> {{Center}}, "Rows" -> {{Center}}}, 
    AutoDelete -> False, GridBoxItemSize -> Automatic, 
    BaselinePosition -> {1, 1}]& ),
  Editable->True,
  InterpretationFunction->(RowBox[{"Legended", "[", 
     RowBox[{#, ",", 
       RowBox[{"Placed", "[", 
         RowBox[{#2, ",", "After"}], "]"}]}], "]"}]& )]], "Output"]
}, Open  ]],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{
  RowBox[{"Table", "[", "\[IndentingNewLine]", 
   RowBox[{
    RowBox[{"ListLinePlot", "[", 
     RowBox[{
      RowBox[{"sinWaveMedianFilterPlottingData", "[", 
       RowBox[{"128", ",", " ", "wl"}], "]"}], ",", " ", 
      RowBox[{"PlotLabel", "\[Rule]", 
       RowBox[{"\"\<Window Length = \>\"", "<>", 
        RowBox[{"ToString", "[", "wl", "]"}]}]}], ",", 
      RowBox[{"AspectRatio", "\[Rule]", 
       RowBox[{"1", "/", "5"}]}], ",", " ", 
      RowBox[{"ImageSize", "\[Rule]", 
       RowBox[{"72", "*", "10"}]}], ",", " ", 
      RowBox[{"PlotStyle", "\[Rule]", 
       RowBox[{"{", 
        RowBox[{
         RowBox[{"Directive", "[", 
          RowBox[{"Black", ",", "Thin"}], "]"}], ",", 
         RowBox[{"Directive", "[", 
          RowBox[{
           RowBox[{"Thickness", "[", "0.01", "]"}], ",", " ", 
           RowBox[{"Opacity", "[", 
            RowBox[{"0.5", ",", " ", "Black"}], "]"}]}], "]"}], ",", " ", 
         RowBox[{"Directive", "[", "Red", "]"}]}], "}"}]}]}], "]"}], ",", 
    "\[IndentingNewLine]", 
    RowBox[{"{", 
     RowBox[{"wl", ",", " ", "1", ",", " ", "256", ",", " ", "20"}], "}"}]}], 
   "]"}], " ", "//", "TableForm"}]], "Input"],

Cell[BoxData[
 TagBox[
  TagBox[GridBox[{
     {
      GraphicsBox[{{}, {{}, {}, 
         {GrayLevel[0], PointSize[0.005555555555555556], Thickness[Tiny], 
          LineBox[CompressedData["
1:eJxd2nl8lNW5B3Da0oq21nhdCO31dnArWsWoqGERfoBgFNAoAgFZhoSEQFgm
+2R/Z99ncq33SluFERXBBSKiRot1rveqqQvEBUhQcACBiFuslmLr59q5vud8
7vM7/MPnvJMz73ve8zzP933PmZGla+8s/+GQIUN+MHTIkP/73/43OOm0hede
e+mmp3aqA+jbd+aX5b/aMsluDsMPd1y2c9Pw51U7D5OWJtfk9bys2ufijE0r
JnSf6lHtfJy7ZGTLNyN2q/a/4rv1e0b/5N53VNuB9371eP3vU3tU+0JUbNm6
6XBbn2pfjMzCQ6fnLXpftS/F2JM/KVz0m4OqPQqffHfh70K1WdW+HK9Ubh07
/rVDqn0FClyHvv3bWUdUezT2XnD6JV/N/Ei1C7Dh0/iYFW1HVftqvDG+o2J9
+phqX4Mntq288MNnjqv2tbhx+HlV1s4B1R6DyaGvbs4+/bFqX4eHHvz5ZRV/
OKHa1+PGNSOm+Wo+Ue0bsO1F68vthZ+qdiGqX5vwdfNnuj0WNyWu2V3V+Zlq
j8PR4MmhI0d+rtrjsf/KV+dO3qDbE7C34J5/tJ/xhWrfiG0L/7b7vlLdnojz
HxnWMedR3Z6ESy95+6FEn24D7aubjow8qdoWYB8fVJ9PNj6fbPSfgnz5/dYU
bKfzT8V+eX3WVPTT9d+Ej+T4rJswncY/DbXy/ljTsJ3u33RMkvfXmo5NdP9v
xjQ5P9bNmE7zV4Rn5PxaRXiP5v8WPCDjw7oFeyh+bsUYGV/Wrfgzxd8MDMr4
tGZgCsXvTLwu49uaCRfF/yx8JvPDmoURG2T+3IYzZH5Zt2EI5d/tuE7mp3U7
RlP+FuPqPpHfKMYZ0fUzxza9MMH++2K8Zuf/S9+3M8X45unv+9vtIXfgl/b3
223cgWOPfH9+u23dgcHF31+f6n8HzrSvX/W/E4fs8an+d2KZPX7V/078yb4/
qv+duMG+f6r/bJyw76/qPxv/Y99/1X82rrLnR/WfjV57/lT/u7DOnl/V/y70
2vOv+t+Fp+z4UP3vwhQ7flT/OTr/Vf852GjHn+o/BxPs+FT95+j8V/3nwmXH
t+o/F1Pt+Ff95+KwnR+q/1zss/NH9Z+HPju/VP95eMrOP9V/Hobb+an6z9P5
q/qX6PxW/UtgHx9U/Y3PMyVG//k6/1X/+Tr/Vf/5Ov9V//k6/1X/BTr/Vf8F
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
kv9tev9P1f82PEj+t+n9PzX+NlxL/rdhPfnfhgLyvw2Pk/9tvL7d2abzX42/
Tee/Gn8b9pD/bXr/T42/Tee/Gn+b4X+bzn81/na0kf/tsI9r/9sN/9sN/9sN
/9sN/9vxAfnfbvjfjk/J/3bcQuNv1/mvxt+u81+Nv12vr6rxt+Mx8r9dr8+q
8bdjBvnfodd31fg7sJ/mvwMPkf8dOE7+d2A8+d+BA+R/B06S/x0YQ/53oI/8
78BSiv8OfEv+d+B08r8DFeR/B/6N/O/Ab8n/Dqwi/y08If0fZqn1v722/3kW
Zkj/8y3slP47LEyQ9WWUhR7pf4GFs2V9KrTwofQfFt6R9a3IQqGsf8VWLp5E
fSyxcKasn04LR2R9rcz9vay/LgtTZX12W8b6rYV7ZH0PW9gh63+npfeH7PY6
i/f/0xaukb5sthCX/nRZvD7dben8V/XbQoX0rcfCLOlfr8X7432Wzn9V3y3s
kr4OWLz+Pmix/6csw38PWqXvwzywjyv/8zzokJ/ne3CZ7O/w4Fz5/aM8ev9R
zb9H57+afw+OyuuHh/c3ijw6/9X8e9Au70+JB6/I++f06P1VNf8ePC7vv8uD
2XJ+3B7cQPs3Hr2/q+bfo/Nfzb8Hf5Txsc7D+0fp3PllfG324KCMvy4Pzhly
0f/HZ7cH19Pza+58Mr57PFgv47/Xg5dlfvR58FPpf9aDlTK/BjxIS/8HPRgh
8/OUB3XkvxcvSv+HebHxu+TIC84+afuf58VY6X++F09L/x1ePO8U9WWUF5Nl
/Snw4meyPhV6cUD6Dy/ulfWtyItqWf+Kvdgq62OJFz+V9dPpxf/K+lrp5f1X
lxejZH12e7GT1m+92CLre9iLP8v63+lFWvqwLvd90o+0l/eXN3vxgPSny4ur
pE/dXrxAfnn171vsdo8XkP71etEvfezz4qD0M+tl/we87P+gF2dLn095jf17
H/s/zAf7uPI/z/g838f9HT72f5QPz8nzF/jwnry+Qh8+kNcPHz6T4yvyYa4c
f7FP/z5Kzb8Pz8r75/Rhlry/lT78Tt5/l49/n+H2YSbt3/jwmpzfsA+v0Pz7
8LCMj3U+fCzjJ527Xhlfm338+5MuH07J+Oz2wUXPrz5slPHd40O5jP/e3Hw4
RH70+TBD+p/14Su5vzbgw69l/g36cL/0/5QPrc9I//3YLff3hvnV+v9+5b8f
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

           "]]}, 
         {GrayLevel[0], PointSize[0.005555555555555556], Thickness[0.01], 
          Opacity[0.5], LineBox[CompressedData["
1:eJxd2nl8lNW5B3Da0oq21nhdCO31dnArWsWoqGERfoBgFNAoAgFZhoSEQFgm
+2R/Z99ncq33SluFERXBBSKiRot1rveqqQvEBUhQcACBiFuslmLr59q5vud8
7vM7/MPnvJMz73ve8zzP933PmZGla+8s/+GQIUN+MHTIkP/73/43OOm0hede
e+mmp3aqA+jbd+aX5b/aMsluDsMPd1y2c9Pw51U7D5OWJtfk9bys2ufijE0r
JnSf6lHtfJy7ZGTLNyN2q/a/4rv1e0b/5N53VNuB9371eP3vU3tU+0JUbNm6
6XBbn2pfjMzCQ6fnLXpftS/F2JM/KVz0m4OqPQqffHfh70K1WdW+HK9Ubh07
/rVDqn0FClyHvv3bWUdUezT2XnD6JV/N/Ei1C7Dh0/iYFW1HVftqvDG+o2J9
+phqX4Mntq288MNnjqv2tbhx+HlV1s4B1R6DyaGvbs4+/bFqX4eHHvz5ZRV/
OKHa1+PGNSOm+Wo+Ue0bsO1F68vthZ+qdiGqX5vwdfNnuj0WNyWu2V3V+Zlq
j8PR4MmhI0d+rtrjsf/KV+dO3qDbE7C34J5/tJ/xhWrfiG0L/7b7vlLdnojz
HxnWMedR3Z6ESy95+6FEn24D7aubjow8qdoWYB8fVJ9PNj6fbPSfgnz5/dYU
bKfzT8V+eX3WVPTT9d+Ej+T4rJswncY/DbXy/ljTsJ3u33RMkvfXmo5NdP9v
xjQ5P9bNmE7zV4Rn5PxaRXiP5v8WPCDjw7oFeyh+bsUYGV/Wrfgzxd8MDMr4
tGZgCsXvTLwu49uaCRfF/yx8JvPDmoURG2T+3IYzZH5Zt2EI5d/tuE7mp3U7
RlP+FuPqPpHfKMYZ0fUzxza9MMH++2K8Zuf/S9+3M8X45unv+9vtIXfgl/b3
223cgWOPfH9+u23dgcHF31+f6n8HzrSvX/W/E4fs8an+d2KZPX7V/078yb4/
qv+duMG+f6r/bJyw76/qPxv/Y99/1X82rrLnR/WfjV57/lT/u7DOnl/V/y70
2vOv+t+Fp+z4UP3vwhQ7flT/OTr/Vf852GjHn+o/BxPs+FT95+j8V/3nwmXH
t+o/F1Pt+Ff95+KwnR+q/1zss/NH9Z+HPju/VP95eMrOP9V/Hobb+an6z9P5
q/qX6PxW/UtgHx9U/Y3PMyVG//k6/1X/+Tr/Vf/5Ov9V//k6/1X/BTr/Vf8F
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
kv9tev9P1f82PEj+t+n9PzX+NlxL/rdhPfnfhgLyvw2Pk/9tvL7d2abzX42/
Tee/Gn8b9pD/bXr/T42/Tee/Gn+b4X+bzn81/na0kf/tsI9r/9sN/9sN/9sN
/9sN/9vxAfnfbvjfjk/J/3bcQuNv1/mvxt+u81+Nv12vr6rxt+Mx8r9dr8+q
8bdjBvnfodd31fg7sJ/mvwMPkf8dOE7+d2A8+d+BA+R/B06S/x0YQ/53oI/8
78BSiv8OfEv+d+B08r8DFeR/B/6N/O/Ab8n/Dqwi/y08If0fZqn1v722/3kW
Zkj/8y3slP47LEyQ9WWUhR7pf4GFs2V9KrTwofQfFt6R9a3IQqGsf8VWLp5E
fSyxcKasn04LR2R9rcz9vay/LgtTZX12W8b6rYV7ZH0PW9gh63+npfeH7PY6
i/f/0xaukb5sthCX/nRZvD7dben8V/XbQoX0rcfCLOlfr8X7432Wzn9V3y3s
kr4OWLz+Pmix/6csw38PWqXvwzywjyv/8zzokJ/ne3CZ7O/w4Fz5/aM8ev9R
zb9H57+afw+OyuuHh/c3ijw6/9X8e9Au70+JB6/I++f06P1VNf8ePC7vv8uD
2XJ+3B7cQPs3Hr2/q+bfo/Nfzb8Hf5Txsc7D+0fp3PllfG324KCMvy4Pzhly
0f/HZ7cH19Pza+58Mr57PFgv47/Xg5dlfvR58FPpf9aDlTK/BjxIS/8HPRgh
8/OUB3XkvxcvSv+HebHxu+TIC84+afuf58VY6X++F09L/x1ePO8U9WWUF5Nl
/Snw4meyPhV6cUD6Dy/ulfWtyItqWf+Kvdgq62OJFz+V9dPpxf/K+lrp5f1X
lxejZH12e7GT1m+92CLre9iLP8v63+lFWvqwLvd90o+0l/eXN3vxgPSny4ur
pE/dXrxAfnn171vsdo8XkP71etEvfezz4qD0M+tl/we87P+gF2dLn095jf17
H/s/zAf7uPI/z/g838f9HT72f5QPz8nzF/jwnry+Qh8+kNcPHz6T4yvyYa4c
f7FP/z5Kzb8Pz8r75/Rhlry/lT78Tt5/l49/n+H2YSbt3/jwmpzfsA+v0Pz7
8LCMj3U+fCzjJ527Xhlfm338+5MuH07J+Oz2wUXPrz5slPHd40O5jP/e3Hw4
RH70+TBD+p/14Su5vzbgw69l/g36cL/0/5QPrc9I//3YLff3hvnV+v9+5b8f
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

           "]]}, 
         {RGBColor[1, 0, 0], PointSize[0.005555555555555556], 
          AbsoluteThickness[1.6], LineBox[CompressedData["
1:eJxdzTfMw1oZBuADukNGDwwZGAxCKEIImR76oYduLi10Uy6Eek0P/dBD95jR
Y0aPGc+Y0WNGj//oMSNCDMjPt3x69OrV+5KvPv/scy8MIbzgmRD++/938zvC
8uKSK1zgF+E1fjEu8Uvxy/DL8Qa/Ar8SvwpX+NX4Nfi1+HX49fgN+I14i9+E
34zfgt+K34bfjt+B49IJh3eS4/AuchzeTY7De8hxeC85Du8jx+H95DjsyHH4
ADkOHyTH4UPkOHyYHIePkOPwUXIcPkaOQ710xAlnHD5OHyeccXiWPk444/AJ
+jjhjMMn6eOEMw6foo8Tzjh8mj5OOOPwGfo44YzDnj5OOOPwWfo44YzD5+jj
hDMOn6ePE844fIE+Tjjj8EX6OOGMw5fo44QzDl+mjxPOODRLlzjiBifc44wn
HL7CPo64wQn3OOMJh6+yjyNucMI9znjC4Wvs44gbnHCPM55w+Dr7OOIGJ9zj
jCccnmMfR9zghHuc8YTDN9jHETc44R5nPOHwTfZxxA1OuMcZTzgc2McRNzjh
Hmc84fAt9nHEDU64xxlPOHybfRxxgxPuccYTDt9hH0fc4IR7nPGEw3fZxxE3
OOEeZzzh8D32ccQNTrjHGU84fJ99HHGDE+5xxhMOz7OPI25wwj3OeMKhXbrA
Ja5wxDVucIsT7nCPB5zxiCc84/CDpQtc4gpHXOMGtzjhDvd4wBmPeMIzDj9c
usAlrnDENW5wixPucI8HnPGIJzzj8KOlC1ziCkdc4wa3OOEO93jAGY94wjMO
P166wCWucMQ1bnCLE+5wjwec8YgnPOPwk6ULXOIKR1zjBrc44Q73eMAZj3jC
Mw4/XbrAJa5wxDVucIsT7nCPB5zxiCc84/CzpQtc4gpHXOMGtzjhDvd4wBmP
eMIzDselC1ziCkdc4wa3OOEO93jAGY94wjMOP1+6wCWucMQ1bnCLE+5wjwec
8YgnPOPwi6ULXOIKR1zjBrc44Q73eMAZj3jCMw6/XLrAJa5wxDVucIsT7nCP
B5zxiCc84/CrpQtc4gpHXOMGtzjhDvd4wBmPeMIzDr9eusAlrnDENW5wixPu
cI8HnPGIJzzj8JulC1ziCkdc4wa3OOEO93jAGY94wjMOv126wCWucMQ1bnCL
E+5wjwec8YgnPOOQll7hAq9xiTe4wlsc8Q7XeI8bfMAtPuKET7jDZ9zjCx7w
FWd8wyO+4wk/4Rk/cPjd0itc4DUu8QZXeIsj3uEa73GDD7jFR5zwCXf4jHt8
wQO+4oxveMR3POEnPOMHDr9feoULvMYl3uAKb3HEO1zjPW7wAbf4iBM+4Q6f
cY8veMBXnPENj/iOJ/yEZ/zA4Q9Lr3CB17jEG1zhLY54h2u8xw0+4BYfccIn
3OEz7vEFD/iKM77hEd/xhJ/wjB84/HHpFS7wGpd4gyu8xRHvcI33uMEH3OIj
TviEO3zGPb7gAV9xxjc84jue8BOe8QOHPy29wgVe4xJvcIW3OOIdrvEeN/iA
W3zECZ9wh8+4xxc84CvO+IZHfMcTfsIzfuDw56VXuMBrXOINrvAWR7zDNd7j
Bh9wi4844RPu8Bn3+IIHfMUZ3/CI73jCT3jGDxz+svQKF3iNS7zBFd7iiHe4
xnvc4ANu8REnfMIdPuMeX/CArzjjGx7xHU/4Cc/4gcNp6RUu8BqXeIMrvMUR
73CN97jBB9ziI074hDt8xj2+4AFfccY3POI7nvATnvEDh78uvcIFXuMSb3CF
tzjiHa7xHjf4gFt8xAmfcIfPuMcXPOArzviGR3zHE37CM37g8LelV7jAa1zi
Da7wFke8wzXe4wYfcIuPOOET7vAZ9/iCB3zFGd/wiO94wk94xg8c/r70Chd4
jUu8wRXe4oh3uMZ73OADbvERJ3zCHT7jHl/wgK844xse8R1P+AnP+IHDP5Ze
4QKvcYk3uMJbHPEO13iPG3zALT7ihE+4w2fc4wse8BVnfMMjvuMJP+EZP3D4
59IrXOA1LvEGV3iLI97hGu9xgw+4xUec8Al3+Ix7fMEDvuKMb3jEdzzhJzzj
Bw7/WnqFC7zGJd7gCm9xxDtc4z1u8AG3+IgTPuEOn3GPL3jAV5zxDY/4jif8
hGf8wOHfS69wgde4xBtc4S2OeIdrvMcNPuAWH3HCJ9zhM+7xBQ/4ijO+4RHf
8YSf8IwfOHRLP/N//wf3YKpi
           "]]}}, {}},
       AspectRatio->NCache[
         Rational[1, 5], 0.2],
       Axes->{True, True},
       AxesLabel->{None, None},
       AxesOrigin->{0, 0},
       DisplayFunction->Identity,
       Frame->{{False, False}, {False, False}},
       FrameLabel->{{None, None}, {None, None}},
       FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
       GridLines->{None, None},
       GridLinesStyle->Directive[
         GrayLevel[0.5, 0.4]],
       ImageSize->720,
       Method->{},
       PlotLabel->FormBox["\"Window Length = 1\"", TraditionalForm],
       PlotRange->{{0., 1025.}, {-1., 1.}},
       PlotRangeClipping->True,
       PlotRangePadding->{{
          Scaled[0.02], 
          Scaled[0.02]}, {
          Scaled[0.05], 
          Scaled[0.05]}},
       Ticks->{Automatic, Automatic}]},
     {
      GraphicsBox[{{}, {{}, {}, 
         {GrayLevel[0], PointSize[0.005555555555555556], Thickness[Tiny], 
          LineBox[CompressedData["
1:eJxd2nl8lNW5B3Da0oq21nhdCO31dnArWsWoqGERfoBgFNAoAgFZhoSEQFgm
+2R/Z99ncq33SluFERXBBSKiRot1rveqqQvEBUhQcACBiFuslmLr59q5vud8
7vM7/MPnvJMz73ve8zzP933PmZGla+8s/+GQIUN+MHTIkP/73/43OOm0hede
e+mmp3aqA+jbd+aX5b/aMsluDsMPd1y2c9Pw51U7D5OWJtfk9bys2ufijE0r
JnSf6lHtfJy7ZGTLNyN2q/a/4rv1e0b/5N53VNuB9371eP3vU3tU+0JUbNm6
6XBbn2pfjMzCQ6fnLXpftS/F2JM/KVz0m4OqPQqffHfh70K1WdW+HK9Ubh07
/rVDqn0FClyHvv3bWUdUezT2XnD6JV/N/Ei1C7Dh0/iYFW1HVftqvDG+o2J9
+phqX4Mntq288MNnjqv2tbhx+HlV1s4B1R6DyaGvbs4+/bFqX4eHHvz5ZRV/
OKHa1+PGNSOm+Wo+Ue0bsO1F68vthZ+qdiGqX5vwdfNnuj0WNyWu2V3V+Zlq
j8PR4MmhI0d+rtrjsf/KV+dO3qDbE7C34J5/tJ/xhWrfiG0L/7b7vlLdnojz
HxnWMedR3Z6ESy95+6FEn24D7aubjow8qdoWYB8fVJ9PNj6fbPSfgnz5/dYU
bKfzT8V+eX3WVPTT9d+Ej+T4rJswncY/DbXy/ljTsJ3u33RMkvfXmo5NdP9v
xjQ5P9bNmE7zV4Rn5PxaRXiP5v8WPCDjw7oFeyh+bsUYGV/Wrfgzxd8MDMr4
tGZgCsXvTLwu49uaCRfF/yx8JvPDmoURG2T+3IYzZH5Zt2EI5d/tuE7mp3U7
RlP+FuPqPpHfKMYZ0fUzxza9MMH++2K8Zuf/S9+3M8X45unv+9vtIXfgl/b3
223cgWOPfH9+u23dgcHF31+f6n8HzrSvX/W/E4fs8an+d2KZPX7V/078yb4/
qv+duMG+f6r/bJyw76/qPxv/Y99/1X82rrLnR/WfjV57/lT/u7DOnl/V/y70
2vOv+t+Fp+z4UP3vwhQ7flT/OTr/Vf852GjHn+o/BxPs+FT95+j8V/3nwmXH
t+o/F1Pt+Ff95+KwnR+q/1zss/NH9Z+HPju/VP95eMrOP9V/Hobb+an6z9P5
q/qX6PxW/UtgHx9U/Y3PMyVG//k6/1X/+Tr/Vf/5Ov9V//k6/1X/BTr/Vf8F
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
kv9tev9P1f82PEj+t+n9PzX+NlxL/rdhPfnfhgLyvw2Pk/9tvL7d2abzX42/
Tee/Gn8b9pD/bXr/T42/Tee/Gn+b4X+bzn81/na0kf/tsI9r/9sN/9sN/9sN
/9sN/9vxAfnfbvjfjk/J/3bcQuNv1/mvxt+u81+Nv12vr6rxt+Mx8r9dr8+q
8bdjBvnfodd31fg7sJ/mvwMPkf8dOE7+d2A8+d+BA+R/B06S/x0YQ/53oI/8
78BSiv8OfEv+d+B08r8DFeR/B/6N/O/Ab8n/Dqwi/y08If0fZqn1v722/3kW
Zkj/8y3slP47LEyQ9WWUhR7pf4GFs2V9KrTwofQfFt6R9a3IQqGsf8VWLp5E
fSyxcKasn04LR2R9rcz9vay/LgtTZX12W8b6rYV7ZH0PW9gh63+npfeH7PY6
i/f/0xaukb5sthCX/nRZvD7dben8V/XbQoX0rcfCLOlfr8X7432Wzn9V3y3s
kr4OWLz+Pmix/6csw38PWqXvwzywjyv/8zzokJ/ne3CZ7O/w4Fz5/aM8ev9R
zb9H57+afw+OyuuHh/c3ijw6/9X8e9Au70+JB6/I++f06P1VNf8ePC7vv8uD
2XJ+3B7cQPs3Hr2/q+bfo/Nfzb8Hf5Txsc7D+0fp3PllfG324KCMvy4Pzhly
0f/HZ7cH19Pza+58Mr57PFgv47/Xg5dlfvR58FPpf9aDlTK/BjxIS/8HPRgh
8/OUB3XkvxcvSv+HebHxu+TIC84+afuf58VY6X++F09L/x1ePO8U9WWUF5Nl
/Snw4meyPhV6cUD6Dy/ulfWtyItqWf+Kvdgq62OJFz+V9dPpxf/K+lrp5f1X
lxejZH12e7GT1m+92CLre9iLP8v63+lFWvqwLvd90o+0l/eXN3vxgPSny4ur
pE/dXrxAfnn171vsdo8XkP71etEvfezz4qD0M+tl/we87P+gF2dLn095jf17
H/s/zAf7uPI/z/g838f9HT72f5QPz8nzF/jwnry+Qh8+kNcPHz6T4yvyYa4c
f7FP/z5Kzb8Pz8r75/Rhlry/lT78Tt5/l49/n+H2YSbt3/jwmpzfsA+v0Pz7
8LCMj3U+fCzjJ527Xhlfm338+5MuH07J+Oz2wUXPrz5slPHd40O5jP/e3Hw4
RH70+TBD+p/14Su5vzbgw69l/g36cL/0/5QPrc9I//3YLff3hvnV+v9+5b8f
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

           "]]}, 
         {GrayLevel[0], PointSize[0.005555555555555556], Thickness[0.01], 
          Opacity[0.5], LineBox[CompressedData["
1:eJxdmnmYVNWZxisJiWhibEeN7WSclJqYjlEsFbVZhBcQbAW0FUFElgLsphsE
qvdqeru171U9xpmQRKFEJY0LtoqKBmONM2rHBToq0KBiAbKIWxkN0yY+Y2qs
c5/53s9/fF66Tt37nfO97+/ec+qcJatvqvm2w+H41giH4//+X/qvMPGE+adf
dv7Gx7aZf8DQ7pM/q/nJpoklORLf3vKLbRvPfMboMkxcnF5VNvCC0afjpI31
47cODxhdjtMXndPx5Vk7jP4XfL1u56jv3fWG0U689ZOHWn6b2Wn0uajdtHnj
ga4ho3+K3Pz9J5YteNvo8zHm+PcqF/xyn9EV+PDrc38TacobfQFerNs8ZtzL
+42+EC7P/q/+55SDRo/CrrNP/NnnM9432oX1HyVH13cdMvoSvDqup3Zd9rDR
l+LhR5ef+96TR4y+DFedecYKa9tRo0djUuTza/JPfGD05bjv3h/+ovZ3x4y+
AletOmtqoPFDo6/Eo89Znz1e+ZHRlWh4efwXaz629Rhcnbp0x4rej40ei0Ph
4yPOOecTo8dh70UvzZm03tbjsct159+7T/rU6KuUnqD0RKXB2lLaMUn9XWnH
ZPV3pR1T1N+nYA/d/9V4X9ZnXY1pVP9UNMn5sabicZq/aZgo59eaho00/9dg
qlwf6xpMo/WrwpNyfa0qvEXrfy3ukf1hXYud1D/XYbTsL+s6/In6bzoKsj+t
6ZhM/TsDr8j+tmbAQ/0/Ex9Lf1gzcdZ66Z/rcZL0l3U9HOS/G3C59Kd1A0aR
f6txyZDwN6pxUnzdjDHtz44vfb4aL5f8//w3OleNL5/4ZnxJO27Ej0vfX9K4
EYcf+Ob6JW3diMLCb+7PjL8RJ5fu34y/CftL9ZnxN+H2Uv1m/E34Y2l+zPib
cGVp/sz4WThWml8zfhb+uzT/ZvwsXFxaHzN+FgZL62fG34y1pfU142/GYGn9
zfib8VipP8z4mzG51D9m/Gzb/2b8bGwo9Z8ZPxvjS/1pxs+2/W/Gz4Gn1N9m
/BxMKfW/GT8HB0r+MOPnYHfJP2b8LRgq+cuMV9pSOqe0Y64ar7SldE5px61q
vNKW0rlbbf+b8fNs/5vx82z/m/Hz0CznJzfP9r8Zfxsg5xe32f4342+z/W/G
32b734yfj6fk+mI+dtL6z8c62R+5+TY/zPgFuFz2FxbgFeq/BfhM9mduAa6m
/l2I12R/YyEaqf8X4lPpj9xC/Jj8swg/XCT8hUUYsVH6bxHGSn/mFuHKLdK/
bkweEv52ulHi/3+W+A83npT8d7vx2RMiPyw3zpT5knXjwAMif3JufLRQ5FPe
jZMovxbjPZlvzsVYIvMPi7FN5qN7MS6X+WktxgcyX7OL8V8yf3OLMUrmc34x
dlB+L8GvZb47l2CHzH8sQb/kg3sJJkl+WEsAyZfsEtwr+ZNbgnGST/kl2Ez8
Wmr731x/qe1/c/2l2C/56F5q+99cf6ntL3N9pXNK55V23M7aqTSUdittKZ1V
Oqd0/nb1/FLDzzfOGlxD9dfY/jfXr8ETcv6sGtv/5vo1+D3Nfw2myfXJF7+f
+F+Lp+X6Omuxi9a/lp8P3bX8/GjV4grZX9lavEr9V4u/yP7M12Ia8X8Ztsv+
di5DM/X/MvxF+sO9DGdL/1jLcJrkf3YZTpT8zy3DBOnP/DKA+F+HmyX/nXU4
sWnP84+e8lKJ/6jD/ZL/7joclfy36vBPMl+ydXhX8j9X/Lzkf74Ox9bJ/KrH
uzLfnPWYLPMP9XhW5qO7HmfK/LTqcVTma7YeO2T+5upxkcznfD32Un4vx3/I
fHcux3aZ/1iOByQf3MsByQ9rOa6QfMkut/1vrr8cl0k+5Zfb/jfXX4FWyTfn
CkyW/MMKHJZ8dK9g/lsrmK9ZpXNK55V23MHaqTSUdittKZ1VOqd0/g7b/+b6
K3FM1udcafvfXH8lOuT8uFfa/jfXX4kxcn6zK9FH878SV8n1ya9EFfF/FR6R
6+tchd20/qts/5vrr8L7sn+sVbhS9ld2FfZQ/63C57I/86twIfF/NQZlfztX
41bq/9X4QvrDvRrfkvy3VmO25H92NU6W/M+thl/6M78aVcR/D2r2CH+Xeczz
/ysl/js9uFPmg8uD9yT/4cFMmS/VHuyR/Hd7cK7MJ48HR+X7v+XB2zLfej2A
zL+sB1tlPvZ7cIbMz5wHR2S+DnqwXeZv3mP7v6QLxfsj/jfY/i/psga8LvPf
2YD7JR9cDbb/Tf0NuFzypboBWckfdwMulXzyNOAR4leD7X9Tf4Ptf1N/g+1/
U38Ddkl+5hqwW/J1UOm80gWlHY2sy5R2Ku1SGkpXK+1W2tPI/Lca8aGsr7eR
+Z9tRKecn/5GbJHzl2u0/W/qb7T9b+pvxAS5PoVGXEv8b7L9b+pvwhCtfxOy
sj9cTbb/Tf1NqJT9Vd2EvbL/3E34Qvanpwmj6Pm1CW/I/u5twm3U/004Lv3R
34TvSP7nmnCr9NdgE06V/M83ISz9WWjCjcT/ZrTtEf4ua8YP7l2654UD20v8
dzbDku8HrmbskvxHM66V+VLdjJ2S/+5mnC3zydOMQ5L/VjP2yHzrbcYEmX/Z
Zjwl87G/GafJ/Mw147DM18FmvC7zN9+MC2U+F5oxRPxvwb/LfC9rsf1v8rgF
90k+uFowUfIDLbb/Tf0ttv9N/S24RPLJ02L739TfghbJt94W5n+2hfnf32L7
39TfYvvL1K90XumC0o5W1mVKO5V2KQ2lq5V2K+1pxdv0/NJq+9/U34oqqr/V
9r+pv9X2v6m/FWPl/A62YpOc/3yr7X9Tf6vtf1N/GzbL9S1rs/1v6m/DvbI/
XG04JPsHbRgj+6u6DW/L/nO34a+yPz1tcNHzaxvekv3d24YF1P9tGJb+6G/D
dyX/c21YKP012IYfSf7n2xCX/iy0YR7x34so8d9r3v//bPjvxSrivxevE/+9
mEr892KQ+O/FWcR/Lw4S/73YTfz3YjzlnxdbiP9enEr89+IQ8d9r+9/knxe/
JP57bf+b/GvHXcT/drxG+d+ODcT/dkwg/rdjNPG/HeuJ/+22/0397XiY+N9u
+9/U345JxL92fj/ub1f8b1f8VzqvdEFpxxrFf6WdSruUhtLVSruV9qyx/W/q
X6P4v8b2v6l/DbqI/2vwJPF/je1/U/8a2/+m/jWYSPxfg+uI/x14lPjfgT20
/h3YQPzvwGHifwfGEv878A7xv8P2v6m/A5cS/zuwi/jfgUXU/x34G/G/AycQ
/zuwhPjfgX8m/ncgQ/zvwFLifyd+S/zvRPRI65fH9r5p+N+JBcT/TrxI/O8E
iP+deI3434kziP+d2E/877TP/0z+dWIs5V8nHif+d+IU4n8n3if+F69P/O/E
BcT/Tuwm/nfhV8T/Lvv8z+R/F+4l/nfZ53+m/i5cRvzvwjrifxdcxP8uPET8
7+L97d4u2/+m/i7b/6b+Luwk/nfZ52umfqXzSheUdnSzLlPaqbRLaShdrbRb
aU+34n83PiL+d+Naqr/b9r+pv9v2v6m/295fNfV340Hif7e9P2vq78Z04n+P
vb9r6u/BXlr/HtxH/O/BEeJ/D8YR/3vwLvG/B8eJ/z0YTfzvwRDxvweLqf97
8BXxvwcnEv97UEv878G/Ev978Cvifw/uIP5beFjyf6Rl9v92lfhfZmG65H+5
hW2S/04L42W+VFgYkPx3WThV5lOlhfck/2HhDZlvVRYqZf5VW+iX+TjXwsky
P90WDsp8rSt+Xuavx8IUmc9eS+3fWrhT5nvUwhaZ/72WfT5U0mstPv/PWrhU
8qXPQlLyp9/i/emtlu1/k98WaiXfBizMlPwbtPh8fMiy/W/y3cJ2ydejSheU
Hlba4WM9UukypcuVdipdobRL6UofDsn7h4/PN6p8tv/N+vvQLednrg8vyvlz
++zzVbP+Pjwk59/jwyy5Pl4frqTzG599vmvW32f736y/D3+Q/bHWx+dH2eL1
ZX/1+bBP9l+/D6c5zvv//tzqwxX0/Fq8nuzvAR/Wyf4f9OEF6Y8hH74v+Z/3
Ybn011EfspL/BR/Okv4c9qGZ+O/Hc5L/I/3Y8HX6nLNPPV7if5kfYyT/y/14
QvLf6cczbpEvFX5Mkvnj8uMHMp8q/XhX8h9+3CXzrcqPBpl/1X5slvk414/v
y/x0+/G/Ml/r/Hz+6vGjQuaz149ttH/rxyaZ71E//iTzv9ePrOTD2uL3SX5k
/Xy+3OfHPZI//X5cLPm01Y9niV9++/ctJT3gByT/Bv3YI/k45Mc+yc+8H29J
vh5VuqD0sNKOAOuRSpcpXa60U+kKpV1KVwbwjrx/BPCxrK8qgDmy/uqA/fso
s/4BPCXnzx3ATDm/dQH8Rs6/J8C/z/AGMIPObwJ4Wa5vNIAXaf0DuF/2x9oA
PpD9ky3er+yvvgD//qQ/gGHZn1sD8NDzawAbZH8PBFAj+38wAIdT+GMogOmS
//kAPpfna0cD+Ln0XyGAuyX/hwPofFLyP4gd8nxvZNDs/+81/A+iYpfkfxCb
ZH44g7iM+B/E88T/IJLy/L8yiHKZXwhiO/E/iNHE/yCaiP9BTCL+B3GA+B/E
ZuJ/8fPE/yDeIv4H8W/E/yAep/wP8u/D1gYxjvgfxCXE/yASxP8g/z5taxAP
Ev+DqCH+BzGD+B9U/C/eP/E/qPivdEHpYaUdIcV/pcuULlfaqXSF0i6lK0M4
TPwP2b9vMusfwnXE/xB6iP8hvET8D/HvK+tCeJj4H8Js4n8IlcT/EB4n/ofw
Dq1/CM8R/0P4M/G/eH3ifwh54n8IZxD/QxhL/A9hH/E/hA3E/2K9xP8Qyoj/
ITQR/0PYRPwP4Vzifwhh4n8Y+4n/YYxt6Tnu2LTf+D+MHxH/w9hA/A+jn/gf
RiXxP4wRxP8w9hD/w+gl/oexkvgfxoPE/zBOIP6H8RXxP4wB4n8Y5xP/w/gD
8T+MPuJ/cTzlfxjrif/F7yP+hzGF+B/G3cT/MEYR/8PYSvwPo5H4H8ZE4n9Y
8T+Md4n/Yewk/itdUHpYaUeE9Uily5QuV9qpdIXSLqUrI3z/iCj+R3AL8T+i
+B/B08T/CK4n/kfwO+J/BJOJ/xHMJP5HMED8j+AlWv8INhL/IzhG/I9gLvG/
OJ74H8HfiP8RNBP/i99P/I+gnvgfwQjifwQ3EP8j+DvxP4KLif8RPED8jyBF
/I/ic+J/1Jz/7TP+j+K7xP8o1hL/o7iA+B/FU8T/KALE/yhOJ/5H8QrxPwoX
8T+K1cT/KCYQ/6PIE/+jeJj4H8VE4n8UbxD/o8gQ/6Pop/yPYgvxP4qxxP/i
/RL/o4gT/4v3S/yPYhPxP4rbif9RTCf+R3GQ+B9V/I/ideK/0gWlh5V2xFiP
VLpM6XKlnUpXKO1SujKm+B/j+qpiXH91DBbxP4aXif8xnt+6GB4h/scwh/gf
4/WzYry+0Rj20frH8Efif4z7Jxvj/uqL4QDxP4Yzif8x7t9c8fPE/xg2Ev9j
7I+hGPsnH0Mn8T+Gx4j/MfbncAy/Jv7HMWKv5H8c5yU+O7J/6rB5/49zPpTH
0Uv8j+P3xP84XMT/OOdTZRw7if9xJIn/cc6/6jjn49w4vkP8j3O+1sU5fz1x
/Iz4H8czxP8453s0rvI/jnuI/8XvI/7HmS99ceZPfxwXEf/jzK9cnPk2EMcE
4n8cQ8T/uOJ/XPFf6YLSw0o7Eor/SpcpXa60U+kKpV1KVyYU/xP4hPifUPxP
8PPR3AQ/P7kTuIH4n+DnL0+Cn8+8xc8T/xN4hfifUM9/CX4+XJvAR8T/BOYR
/xP8/Nmf4OfTrQl4if8Jfr4dSPDz72ACI4n/Ccwi/if4+fpogp+/Cwk8QvxP
YD3xP8nP9yOT5vzffv5P4sBOyf8kvz84k/x+UZHEZuJ/Eh3E/yS/vyDJ7zdV
SVxI/E9iBfE/ye9P7iT2Ef+TeIj4n+T3M2+S39+sJNLE/yQepfxP8vvh2iS/
P2aTGEX8TyJK/E/y++nWJPqI/0ksJf4n+f13MMnvx0NJvEn8Tyr+K11Qelhp
R0rxX+kypcuVdipdobRL6coUjhD/U7y/UZXi/Y/qFHzE/xQGiP8p3l+pS2Ez
8T+FW4j/Kd6/sVK8vxNN4T1a/xRyxP8U7x9lU7y/1JfCQeJ/CuXE/xTvX+VS
OEz8T+FB4n+K98eGUrx/lk8hSPxP4Vnif4r354ZTvH/nSOPnxP80GrY1v/lJ
t73/l8Yg8T+NbuJ/GuuJ/2nef3SleX+ysvh9xP80osT/NO9/Vqd5f3RuGl//
VfI/zfurdWnef/WkcR7xP42nif9p3t+NptX+bxp3E//T+CnxP837y31p3n/u
T+NC4n+a969zacX/NK4i/qexm/if5v3zfFrt/ytdUHpYaUdG7f8rXaZ0udJO
pSuUdildmeHzC2TwKfE/g7nE/wyfj8zN8PmJO4Nq4n+Gz188GT6f8RY/T/zP
4FXif0ad/2T4fGhtBp8Q/zOYT/zP8PlTf4bPp7Zm0En8z/D51kCGz78GMziZ
+J/BLcT/DJ+vHc3w+Vshg6eI/xk8Rvzv5fO9Eb3m9z8Ht/0DqHILRg==
           "]]}, 
         {RGBColor[1, 0, 0], PointSize[0.005555555555555556], 
          AbsoluteThickness[1.6], LineBox[CompressedData["
1:eJxd2UuMI0cdx/ECReBjHzgYiUODELIQQs0jYCCQf8LLhFcTHuuEAEV2AoZd
kt4lO3gHdqjd2dnxzOzstsRDBglURx/7aCQkiptPqC9IPiBUF8DHvgQGiQPD
ukt0fesy+ujvv6tao/Kvq/utL77y7EuvV0q97jGl/vd3O5onVTwkZg9O4DfB
ffgtcAq/DX47/A54AL8Tfhf8bjiD3wO/F34f/H74cfgD8AfhIfwh+MPwR+An
4I+K/POZNz/+hnvt//FjomZ/ern+9c9aPynq5K9v/PMff9VaRP3iH/954dXf
bG1E5G+/O0ur37b1p1B/Cv1Pi3S/3zwt6l/d+T/ers89sa0Hh/GJ2AZWn0Qd
Vp9CHVafRh1WI9Rh9RnUYfUM6rD6LOqw+hzqsPo86rD6Auqw+iLqsMpjC2xg
B6svoR82sIPVs+iHDexg9WX0wwZ2sPoK+mEDO1h9Ff2wgR2svoZ+2MAOVpfQ
fyns/z9s+y+JP3q0P7d2l8QdP9q/W6uxuJ8/2t9by1jUdv+3/ai7MfqfC78v
bf9zYqL5n2vXV/1+2x8cxvNYP2xgB6uvox82sIPVC+iHDexg9Q30wwZ2sPom
+mEDO1h9C/2wgR2sdOwUFljDBrawgz2svo35YYE1bGALO9jD6kXMDwusYQNb
2MEeVpcxPyywhg1sL9zNf3c57P+t/WWxx9383gn7e+t0J+z/rQV1vRP2f5v3
O/H9hd0J+7+df6ddX7XNfx8cxku4flhgDRvYwg72sPoO5ocF1rCBLexgD6vv
Yn5YYA0b2MIO9rCaYH5YYA0b2MIO9rD6HuaHBdawgS3sYA+r72N+WGANG9jC
DvawuoL5YYE1bGB7ReS1Tv66K+K6+e+viIny+2qc7+nVOP8FdX01/H60+X41
zn978flo/qvt+tr898Fh/ADXDwusYQNb2MEeVi9jflhgDRvYwg72sHoF88MC
a9jAFnawh1URO4FTOIMFzmENF7CBS9jCFezgGvZwA6trsRM4hTNY4BzWcAEb
uIQtXMEOrq+Jea2Tv/5anP/NNeT/dfHdfE+uS9rN/xT17Hqc/3Lx+W7+59fj
5w/6eru+9vxfBIfrh0vYwhXs4Br2cAOrH8ZO4BTOYIFzWMMFbOAStnAFO7iG
PdzA6tXYCZzCGSxwDmu4gA1cwhauYAfXsIcbWN2IncApnMEC57CGC9jAJWzh
CnZwfSPs/zbvb8Tn/+ZGnN9qN+zvrZPdsP/b+wHUs934/C+74fnf1vlu/PxB
77brc9v8L4LD9cMlbOEKdnANe7iB1Y9iJ3AKZ7DAOazhAjZwCVu4gh1cwx5u
YDWNncApnMEC57CGC9jAJWzhCnZwDXu4gdXN2AmcwhkscA5ruIANXMIWrmAH
1zfD/X+b/zeR/zfD/X+b/3vI/z3kP+rZHvJ/L37+n+8h//fa9YX8Dw7XD5ew
hSvYwTXs4QZWP46dwCmcwQLnsIYL2MAlbOEKdnANe7iB1U9iJ3AKZ7DAOazh
AjZwCVu4gh1cwx5uYHUrdgKncAYLnMMaLmADl7CFK9jB9S3k/634fN7cQv7v
I//3w/u/Nv/3w/u/Nv8vPh/l/77oKP/34+f/er9d36rN/+Bw/XAJW7iCHVzD
Hm5g9dPYCZzCGSxwDmu4gA1cwhauYAfXsIcbWJnYPTiB+3AKD+AMHsICj+Ac
HsMansAFPIUNPINLeA5beAFX8BJ28Aqu4TXs4c2F/93J3+bCx518Pjdio/f3
t8V13+/3bov8vZP/yW1Jf9mp92+LPu30pxf93fwfXPi8M392u13fX7b5Pwxu
h8AjOIfHsIYncAFPYQPP4BKewxZewBW8hB28gmt4DXt4AzfwOazuxO7BCdyH
U3gAZ/AQFngE5/AY1vAELuApbOAZXMJz2MILuIKXsINXcA2vYR/cPl/f3Anv
/9q8vyO2e/4/vyNy0s3/A0m7+d47ENPN/wT1/kHcnx6I7eb/4CDs//Z+4SBe
7xAWeATn8BjW8AQu4Cls4BlcwnPYwgu4gpewg1dwDa9hD2/gBj6H1d3YPTiB
+3AKD+AMHsICj+AcHsMansAFPIUNPINLeA5beAFX8BJ28Aqu4TXs4c1d5P9d
8d18Pr+L/D9E/h8i/w+R/4fI/8P4+weHyP/Ddn0h/4PbIfAIzuExrOEJXMBT
2MAzuITnsIUXcAUvYQev4Bpewx7ewA18Dqt7sXtwAvfhFB7AGTyEBR7BOTyG
NTyBC3gKG3gGl/ActvACruAl7OAVXMNr2MObe/H5v7knOsr/e5JG+X8Un+97
R6Kj/Ee9fxT3p0diovy/cJT/R/H6hrDAIziHx7CGJ3ABT2EDz+ASnsMWXsAV
vIQdvIJreA17eAM38DmsZrF7cAL34RQewBk8hAUewTk8hjU8gQt4Cht4Bpfw
HLbwAq7gJezgFVzDa9jDmxnyf4bz/0xclP/H4qP8PxYd5f+xSJT/x2Ki/D+O
v39wHM+fHbfr823+B7dD4BGcw2NYwxO4gKewgWdwCc9hCy/gCl7CDl7BNbyG
PbyBG/gcViexe3AC9+EUHsAZPIQFHsE5PIY1PIELeAobeAaX8By28AKu4CXs
4BVcw2vYw5sT5P8J8v8E+X+K/D9F/qPeP0X+n+L8f4rz/2m8viEs8AjO4TGs
4QlcwFPYwDO4hOewhRdwBS9hB6/gGl7DHt7ADXwOq/uxe3AC9+EUHsAZPIQF
HsE5PIY1PIELeAobeAaX8By28AKu4CXs4BVcw2vYw5v7yP/7yP/7yP8znP/P
kP9nyP8z5P8Z8v/i81H+n7XrC/kf3A6BR3AOj2ENT+ACnsIGnsElPIctvIAr
eAk7eAXX8Br28AZu4HNYPYjdgxO4D6fwAM7gISzwCM7hMazhCVzAU9jAM7iE
57CFF3AFL2EHr+AaXsMe3jxA/l84yv8HeP7/EM//H+L5P+r9h3j+/zC8/2vz
/2H4/Wnz/2G7vvb9xDC4HQKP4BwewxqewAU8hQ08g0t4Dlt4AVfwEnbwCq7h
NezhDdzA57AqYz/2f/8XLl4iqg==
           "]]}}, {}},
       AspectRatio->NCache[
         Rational[1, 5], 0.2],
       Axes->{True, True},
       AxesLabel->{None, None},
       AxesOrigin->{0, 0},
       DisplayFunction->Identity,
       Frame->{{False, False}, {False, False}},
       FrameLabel->{{None, None}, {None, None}},
       FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
       GridLines->{None, None},
       GridLinesStyle->Directive[
         GrayLevel[0.5, 0.4]],
       ImageSize->720,
       Method->{},
       PlotLabel->FormBox["\"Window Length = 21\"", TraditionalForm],
       PlotRange->{{0., 1025.}, {-1., 1.}},
       PlotRangeClipping->True,
       PlotRangePadding->{{
          Scaled[0.02], 
          Scaled[0.02]}, {
          Scaled[0.05], 
          Scaled[0.05]}},
       Ticks->{Automatic, Automatic}]},
     {
      GraphicsBox[{{}, {{}, {}, 
         {GrayLevel[0], PointSize[0.005555555555555556], Thickness[Tiny], 
          LineBox[CompressedData["
1:eJxd2nl8lNW5B3Da0oq21nhdCO31dnArWsWoqGERfoBgFNAoAgFZhoSEQFgm
+2R/Z99ncq33SluFERXBBSKiRot1rveqqQvEBUhQcACBiFuslmLr59q5vud8
7vM7/MPnvJMz73ve8zzP933PmZGla+8s/+GQIUN+MHTIkP/73/43OOm0hede
e+mmp3aqA+jbd+aX5b/aMsluDsMPd1y2c9Pw51U7D5OWJtfk9bys2ufijE0r
JnSf6lHtfJy7ZGTLNyN2q/a/4rv1e0b/5N53VNuB9371eP3vU3tU+0JUbNm6
6XBbn2pfjMzCQ6fnLXpftS/F2JM/KVz0m4OqPQqffHfh70K1WdW+HK9Ubh07
/rVDqn0FClyHvv3bWUdUezT2XnD6JV/N/Ei1C7Dh0/iYFW1HVftqvDG+o2J9
+phqX4Mntq288MNnjqv2tbhx+HlV1s4B1R6DyaGvbs4+/bFqX4eHHvz5ZRV/
OKHa1+PGNSOm+Wo+Ue0bsO1F68vthZ+qdiGqX5vwdfNnuj0WNyWu2V3V+Zlq
j8PR4MmhI0d+rtrjsf/KV+dO3qDbE7C34J5/tJ/xhWrfiG0L/7b7vlLdnojz
HxnWMedR3Z6ESy95+6FEn24D7aubjow8qdoWYB8fVJ9PNj6fbPSfgnz5/dYU
bKfzT8V+eX3WVPTT9d+Ej+T4rJswncY/DbXy/ljTsJ3u33RMkvfXmo5NdP9v
xjQ5P9bNmE7zV4Rn5PxaRXiP5v8WPCDjw7oFeyh+bsUYGV/Wrfgzxd8MDMr4
tGZgCsXvTLwu49uaCRfF/yx8JvPDmoURG2T+3IYzZH5Zt2EI5d/tuE7mp3U7
RlP+FuPqPpHfKMYZ0fUzxza9MMH++2K8Zuf/S9+3M8X45unv+9vtIXfgl/b3
223cgWOPfH9+u23dgcHF31+f6n8HzrSvX/W/E4fs8an+d2KZPX7V/078yb4/
qv+duMG+f6r/bJyw76/qPxv/Y99/1X82rrLnR/WfjV57/lT/u7DOnl/V/y70
2vOv+t+Fp+z4UP3vwhQ7flT/OTr/Vf852GjHn+o/BxPs+FT95+j8V/3nwmXH
t+o/F1Pt+Ff95+KwnR+q/1zss/NH9Z+HPju/VP95eMrOP9V/Hobb+an6z9P5
q/qX6PxW/UtgHx9U/Y3PMyVG//k6/1X/+Tr/Vf/5Ov9V//k6/1X/BTr/Vf8F
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
kv9tev9P1f82PEj+t+n9PzX+NlxL/rdhPfnfhgLyvw2Pk/9tvL7d2abzX42/
Tee/Gn8b9pD/bXr/T42/Tee/Gn+b4X+bzn81/na0kf/tsI9r/9sN/9sN/9sN
/9sN/9vxAfnfbvjfjk/J/3bcQuNv1/mvxt+u81+Nv12vr6rxt+Mx8r9dr8+q
8bdjBvnfodd31fg7sJ/mvwMPkf8dOE7+d2A8+d+BA+R/B06S/x0YQ/53oI/8
78BSiv8OfEv+d+B08r8DFeR/B/6N/O/Ab8n/Dqwi/y08If0fZqn1v722/3kW
Zkj/8y3slP47LEyQ9WWUhR7pf4GFs2V9KrTwofQfFt6R9a3IQqGsf8VWLp5E
fSyxcKasn04LR2R9rcz9vay/LgtTZX12W8b6rYV7ZH0PW9gh63+npfeH7PY6
i/f/0xaukb5sthCX/nRZvD7dben8V/XbQoX0rcfCLOlfr8X7432Wzn9V3y3s
kr4OWLz+Pmix/6csw38PWqXvwzywjyv/8zzokJ/ne3CZ7O/w4Fz5/aM8ev9R
zb9H57+afw+OyuuHh/c3ijw6/9X8e9Au70+JB6/I++f06P1VNf8ePC7vv8uD
2XJ+3B7cQPs3Hr2/q+bfo/Nfzb8Hf5Txsc7D+0fp3PllfG324KCMvy4Pzhly
0f/HZ7cH19Pza+58Mr57PFgv47/Xg5dlfvR58FPpf9aDlTK/BjxIS/8HPRgh
8/OUB3XkvxcvSv+HebHxu+TIC84+afuf58VY6X++F09L/x1ePO8U9WWUF5Nl
/Snw4meyPhV6cUD6Dy/ulfWtyItqWf+Kvdgq62OJFz+V9dPpxf/K+lrp5f1X
lxejZH12e7GT1m+92CLre9iLP8v63+lFWvqwLvd90o+0l/eXN3vxgPSny4ur
pE/dXrxAfnn171vsdo8XkP71etEvfezz4qD0M+tl/we87P+gF2dLn095jf17
H/s/zAf7uPI/z/g838f9HT72f5QPz8nzF/jwnry+Qh8+kNcPHz6T4yvyYa4c
f7FP/z5Kzb8Pz8r75/Rhlry/lT78Tt5/l49/n+H2YSbt3/jwmpzfsA+v0Pz7
8LCMj3U+fCzjJ527Xhlfm338+5MuH07J+Oz2wUXPrz5slPHd40O5jP/e3Hw4
RH70+TBD+p/14Su5vzbgw69l/g36cL/0/5QPrc9I//3YLff3hvnV+v9+5b8f
o/ZK//3YIuuHw49ryX8/XiL//YjL/f9CP/Jl/YIfu8h/P8aQ/37Ukv9+TCb/
/ThM/vuxlfzP/T3578d75L8f/07++7Gd6r+ffx+2zo/x5L8fV5P/fsTIfz//
Pq3bj8fIfz/KyX8/ZpL/fsP/3PWT/37Df7/hvx/nkf9+w/+A4X8A9nHtf8Dw
P2D4H+DvHxUw/A8Y/gdwjPwP6N83qfkP4FbyP3d+8j+AV8n/AP++sjKAJ8j/
AOaQ/wEUkv8BbCf/c9dL8x/Ai+R/AG+T/7nzk/8BZMn/3P0h/wMYR/4HcJD8
D2Aj+Z8bL/kfQB75H0At+R/AFvI/gAvJ/wCC5H8Qh8j/IMbVd5wcsuWQyv8g
zif/g9hI/gfRRf4HUUj+BzGU/A+in/wPopP8D2I1+R/EY+R/EKeR/0F8S/4H
0UP+B3Ep+R/EH8n/IDaT/7n+VP+D2ED+576P/A9iKvkfxP3kfxCjyf8gusn/
IGrI/yAmkf9Bw/8gDpD/Qewh/4N4nPwPIo/8Dxr+hwz/Q7CPa/+Nz/NDhv8h
w/+Q4X+Ir68wxNePkOF/CPPI/5Dhf+77yf8QbiP/Q/gD+R/CFPI/hFnkfwg9
5H8Ir9L8h7CJ/A/hBPkfQgn5n+tP/ofwd/I/hDryP/f95H8IK8j/EIaS/yHc
Tv6H8A/yP4SryP8QHiH/Q0iQ/2F8Rf6H1f7fQZX/YfyY/A9jHfkfxuXkfxjP
kv9h+Mj/MM4l/8N4nfwPo4D8D2Mt+R/GRPI/jCz5H8YT5H8Yk8j/MN4h/8NI
kf9hdFH9D2MH+R/GOPI/d73kfxhR8j93veR/GFvI/zCWkf9hzCD/wzhC/ocN
/8N4i/wPs7+DYcP/sOF/xPA/Avu49j9i+B8x/I8Y/kcM/yM4QP5HDP8jPL6i
CI+/OAKL/I/gNfI/wve3MoInyf8I5pL/EZ4/K8LzG47gIM1/BH8i/yMcP+kI
x9fmCA6T/xEMJ/8jHL+Z3N+T/xFsIv8jnB99Ec6fbG7+yP/c/Sf/I5yfpyK4
j/yPYuh+6X8UF8W+PH5o2in1/h/l+pAfRSf5H8Wj5H8UBeR/lOtTYRR7yP8o
4uR/lOtfcZTrY0kUPyL/o1xfK6Ncf11RXEL+R/E8+R/l+h6OGvU/igfI/9z3
kf9R9mVzlP3piuJK8j/KfmWi7FtPFBPJ/yj6yP+o4X/U8D9q+B81/I8a/scM
/2Owj2v/jc/zY4b/MfyC/I+hm/yPGf7HDP9j+Jz8jxn+x/j5qCTGz0/OGG4n
/2P8/OWK8fOZO/f35H8Mr5P/MeP5L8bPh+ti+JT8j2EB+R/j58+uGD+fdsfg
Jv9j/HzbE+Pn394YhpH/Mcwm/2P8fD0Q4+fvwRieJP9j2ED+x/n5flhc7f/r
5/84Du+R/sf5/cER5/eLUXFsJf/jaCH/4/z+gji/3xTFcQX5H0cV+R/n9ydn
HAfJ/zgeJ//j/H7mjvP7mxVHkvyPYxvV/zi/H66L8/tjOo7R5H8cYfI/zu+n
3XFsJv/jKCP/4/z+2xvn9+O+ON4l/+OG/3HD/7jhf9zwP4EW8j8B+7j2P2H4
nzD8Txj+J3j9oSBh+J/AcfI/wesbRQle/yhOwEP+J9BD/id4faUyga3kfwLz
yP8Er99YCV7fCSfwIc1/AhnyP8HrR+kEry9tTuAI+Z9APvmf4PWrTALHyP8E
HiP/E7w+1pfg9bNsAn7yP4EXyP8Er8+dSvD63ZAkfk3+J1G9s+7dz9v1+l8S
veR/Eu3kfxIbyP8krz8WJHl9sjD3feR/EmHyP8nrn8VJXh8tSeK7v0r/k7y+
Wpnk9VdXEheR/0k8R/4neX03nDTWf5O4n/xP4mLyP8nry5uTvP7clcQV5H+S
168zScP/JG4k/5PYR/4nef08m+T19YFkzhPpf9LwP2n4nzL8T8E+rv03Ps9P
Gf6nDP9Thv8p3p8oTPH+BVL4gvxPoYT8T/H+SEmK90+cKRST/ynef3GleH/G
nft78j+FN8j/lLH/k+L9oXUpfE7+p7CQ/E/x/lNXivenulNoJf9TvL/Vk+L9
r94UziT/U5hH/qd4f20gxftvgyk8S/6n8BT538n7e0M71e9/juz8JxMs3tc=

           "]]}, 
         {GrayLevel[0], PointSize[0.005555555555555556], Thickness[0.01], 
          Opacity[0.5], LineBox[CompressedData["
1:eJxdmnt8VOWZx6ctrcGWOq5aw3bdjtja1FIcBTRchB9YNYqXUUSj3A6xhARL
GEggAwnkZGYyM5lrtnW3tFUYUWlQxPGOFuusu2rqjakVDFjxgLdI3e5YWzZ2
/aw767zns8/v8R8/XzLvnLznfZ7f95z3zZlNq69b/kWPx/OFMR7P//2/+l95
9gmLTp189o4H95p/wPDr4z5a/q2ds6tYgy8+8r29O05/wrAXs5dl27xDzxg+
FSfuaJ25Z3TIcC1OXXpm1yfj9xn+B3y2df+kr9z2qmEfXvvWfet+kdtveAKa
d+7ecXTTsOFvo7joyFjv4jcMn41px79Sv/j7hw3X4Y+fTfh5vN0xfA6ebdk9
bcbzRwxPhD945NP/Oultw5Nw4Iyx3/n4yncM+7Htw/SU1k3vGj4PL87oad6a
f8/w+dj1wMoJbz36vuHJuOj00261944YnoI58Y8vcx7+wPBU3HXn17/X/Mtj
hi/ARW3jL4ms/aPhC/HAU/ZHD9V/aLhe8TTF0xXPUDxT8UWKZymerRjMtmLP
HPVzxZ656ueKPRernyv2/FD9XLHnEvVzxZ5LMVveX/tS7KD7fxkuketjX4ZL
af0a8KhcX7sBr9H6X447ZH3Yl2M/1c8VmCLry74Cv6X6m4eyrE97HuZS/V6J
F2R921ciSPV/Ff5D9od9FcZvk/1zNU6U/WVfDQ/13zWYKvvTvgaTqH8DOG9Y
9DcCODG59cppG56cWf18AM9X+//pz7kYwCcPfz6+yp5r8c3q91cZ1+K9ez6/
fpXta1Fe8vnvZ8Zfi3HV39+Mvw5HqvMz46/Dj6rzN+Ovw2+q98eMvw4XVu+f
GT8fx6r314yfj3+v3n8zfj7Ora6PGT8fper6mfHXY0t1fc3461Gqrr8Zfz0e
rNaHGX895lbrx4xf4Pa/Gb8A26v1Z8YvwMxqfZrxC9z6NeNvYIZiW3FRsedG
NV6xrbio2NOoxiu2FRcVe25S4xXbiouKPTer8YptxUXFnoWAvL9Y6Pa/Gb/Q
7X8zfqHb/2b8Ijwm1xeLsJ/WfxG2yvooLnL9YcYvxlRZX1iMF6j+FuMjWZ/F
xfgh1e8SvCTrG0uwlup/Cf5T9kdxCb5J/bMUX18q+gtLMWaH7L+lmC77s7gU
Fz4i+9fC3GHR3z4LVf//a9X/sPCo9L9l4aOHRX7YFk6X+ZK3cPQekT9FCx8u
EfnkWDiR8msZ3pL55luGJpl/WIa9Mh+tZZgq89Nehg9kvuaX4d9k/haXYZLM
Z2cZ9lF+N+FnMt99Tdgn8x9NKEg/WE2YI/1hNwHSL/km3Cn9U2zCDOknpwm7
yV+3MPsUQ7Gl2FacV1xU7Cj2/EhdXzEUW4ptxXnFRcWOYs9ydX3FUGwptpe7
/W+uvxy/ovu/HJfK9XGW4zLyfzMel+vra8YBWv9mfj60mvn50W7GBbK+8s14
keqvGX+W9ek041Ly/wq8IuvbtwIdVP8r8GfZH9YKnCH7x16BU6T/8yswVvq/
uAKzZH86KwDyfwuul/73tWBs+8GnHzjpuar/0YK7pf+tFoxI/9st+DuZL/kW
vCn9X6x8XvrfacGxrTK/WvGmzDdfK+bK/EMrnpT5aLXidJmfditGZL7mW7FP
5m+xFT+Q+ey04hDl90r8i8x330q8IvMfK3GP9IO1EpD+sFfiAumX/Eq3/831
V2Ky9JOz0q1fc/1bmX2KodhSbCvOKy4qdhR7fqyurxiKLcW24rziomJHsWeV
ur5iKLYU26swTd7f/CoM0v1fhYvk+jir0ED+b8P9cn19bXid1r/N7X9z/Ta8
I+vHbsOFsr7ybThI9deGj2V9Om2YSP5fjZKsb99q3ET1vxp/kf1hrcYXpP/t
1Vgg/Z9fjXHS/8XVCMv+dFajgfwfxPKDor+9QfP8/0LV/74gfiLzwR/EW9L/
COIqmS+BIA5K/1tBTJD5FAxiRL7/20G8IfNtIAjI/MsHsUfmYyGI02R+FoN4
X+ZrKYhXZP46Qbf/q1yu/H7k/zVu/1fZuwYvy/z3rcHd0g/+NW7/m/mvwVTp
l8Aa5KV/rDU4X/opuAb3k78UDyjOKy4oLiouKXYUlxV71jJ7FfsU+xVDcUCx
pTio2FY8oDivuKC4uNbtfzP/tW7/m/mvxSy5PuW1uJz83+72v5l/O4Zp/duR
l/Xhb3f738y/HfWyvgLtOCTrz2rHX2R9BtsxiZ5f2/GqrO+Bdiyk+m/Hcdkf
hXZ8Sfq/2I6bZH+V2nGy9L/Tjpjsz3I7riX/d6DzoOhvbwe+ductB585+krV
/74O2PL9wN+BA9L/6MDlMl8CHdgv/W914AyZT8EOvCv9b3fgoMy3gQ7MkvmX
78BjMh8LHThF5mexA+/JfC114GWZv04HJsp8LndgmPy/Dv8s8927zu1/k8fr
cJf0g38dZkt/YJ3b/2b+69z+N/Nfh/Okn4Lr3Po181c8oDivuKC4qLik2FFc
VuxZz+xV7FPsVwzFAcWW4qBiW/GA4rziguLiekyX97e0Hjvl/XfWu/1v5r/e
7X8z/07sluvr7XT738y/E3fK+vB34l1ZP+jENFlfgU68IevP6sRfZX0GO+Gn
59dOvCbre6ATi6n+OzEq+6PQiS9L/xc7sUT2V6kT35D+dzqRlP1Z7sTN5P8Q
EuT/kHn//53xfwht5P8QXib/h3AJ+T+EEvk/hPHk/xDeJv+H8Dr5P4SZlH8h
PEL+D+Fk8n8I75L/Q27/m/wL4fvk/5Db/yb/NuA28v8GvET5vwHbyf8bMIv8
vwFTyP8bsI38v8HtfzP/DdhF/lM8oDivuKC4qLik2FFcVuzZyOxV7FPsVwzF
AcWW4qBiW/GA4rziguLiRrf/zfw3uv1v5r8Rs8n/G3EF+b8LD5D/u3CQ1r8L
28n/XXiP/N+F6eT/LvyB/N/l9r+ZfxfOJ/934QD5vwtLqf678DfyfxdOIP93
oYn834W/J/93IUf+78It5P9u/IL8343E++s/OXbo98b/3VhM/u/Gs+T/boD8
342XyP/dOI38340j5P9u9/zP5F83plP+deMh8n83TiL/d+Md8n/l+uT/bpxD
/u/G6+T/Tfgp+X+Te/5n8n8T7iT/b3LP/8z8N2Ey+X8TtpL/N8FP/t+E+8h/
igcU5xUXFBcVlxQ7isuKPZuZvYp9iv2KoTig2FIcVGwrHlCcV1xQXNzs7q+a
+W/GveT/ze7+rJn/Zswj//e4+7tm/j04ROvfg7vI/z14n/zfgxnk/x68Sf7v
wXHyfw+mkP97MEz+78Eyqv8efEr+78FY8n8Pmsn/PfhH8n8Pfkr+78GPyf82
dkn/19hm/+9A1f9eG/Ok/2tt7JX+99mYKfOlzsaQ9L/fxskyn+ptvCX9Dxuv
ynxrsFEv8y9goyDzsdHGOJmflo23Zb62VD4v8zdo42KZzyFb7d/a+InM94SN
R2T+D9ju+VCVt9h8/p+3cb70y6CNtPRPweb96T22W78mvxUPKS4pHlbsKB5R
XFY8qtjTy1yj2Ku4VrFPcZ1iv+J6xVDcoDiguFGx1euer5r1r/xc3v9gL+bL
9Qn14kI6v+l1z3fN+ve6/W/Wvxe/lvWxpZfPj/KV68v6GuzFYVl/hV6c4jnr
/+tzTy8uoOfXyvVkfQ/1Yqus/1IvnpH9MdyLr0r/O71YKftrpBd56f9yL8bL
/hztRQf5P4ynpP9rwtj+WfbMM04+XvW/N4xp0v+1YTws/e8L4wlL5EtdGHNk
/vjD+JrMp/ow3pT+Rxi3yXxrCGONzL9AGLtlPjaG8VWZn1YY/yPztSXM56/B
MOpkPofC2Ev7t2HslPmeCOO3Mv8HwshLP2ypfJ/0Rz7M58uDYdwh/VMI41zp
pz1hPEb+UjykuKR4WLGjeERxWfGoYk+EuUaxV3GtYp/iOsV+xfWKobhBcUBx
o2Irgqvk/W2J4Ofy/gcj/PcZoQiupPObCJ6X65uI4Fla/wjulvWxJYIPZP3k
I7hB1tdghP/+pBDBqKzPPREE6fk1gu2yvociWC7rvxSBxyf6YziCedL/TgQf
y/O1kQi+K/uvHMHt0v+jEXQ/Kv0fxT55vlcTNfv/h4z/o6g7IP0fxU6ZH74o
JpP/o3ia/B9FWp7/10dRK/MLUbxC/o9iCvk/inbyfxRzyP9RHCX/R7Gb/F/5
PPk/itfI/1H8E/k/ioco/6P892FbophB/o/iPPJ/FCnyf5T/Pm1PFPeS/xUP
KS4pHlbsKB5RXFY8qtjTx1yj2Ku4VrFPcZ1iv+J6xVDcoDiguFGx1cd/X9nS
h13k/z4sIP/3oZ7834eHyP99+AOtfx+eIv/34Xfk/8r1yf99cMj/fTiN/N+H
6eT/Phwm//dhO/m/D8+R//vgJf/3oZ3834ed5P8+TCD/9yFG/o/hCPk/hunr
eo57dh4x/R/DN8j/MWwn/8dQIP/HUE/+j2EM+T+Gg+T/GAbI/zGsIv/HcC/5
P4YTyP8xfEr+j2GI/B/D2eT/GH5N/o9hkPxfGU/5H8M28n/l+8j/MVxM/o/h
dvJ/DJPI/zE8Tv5XPKS4pHhYsaN4RHFZ8ahiT5y5RrFXca1in+I6xX7F9Yqh
uEFxQHGjYiuOq8n/cfyS/B/HXPJ/HFeR/+MYIv/H8Rytfxw7yP9xHCP/x9FI
/q+MJ//H8Tfyfxwd5P/K95P/42gl/8cxhvwfxzXk/zj+m/wfx7nk/zjuIf/H
kSH/J/Ax+T9hzv8Om/5P4Mvk/wS2kP8TOIf8n8Bj5P8EIuT/BE4l/yfwAvk/
AT/5P4HV5P8EZpH/E3DI/wnsIv8nMJv8n8Cr5P8EcuT/BAqU/wk8Qv5PYDr5
v/L7kv8TSJL/K78v+T+BneR/xUOKS4qHFTuKRxSXFY8q9vQz1yj2Kq5V7FNc
p9ivuF4xFDcoDihuVGz18/1t6cf95P9+3ED+7+f1s/t5fRP9OEzr34/fkP/7
uX7y/Vxfg/04Sv7vx+nk/36u32Ll8+T/fuwg//dzfwz3c/84/egm//fjQfJ/
P/fnaD9+Rv5PYswh6f8kzkp99P6RS0bN+3+S86E2iQHyfxK/Iv8n4Sf/Jzmf
6pPYT/5PIk3+T3L+BZKcj41JfIn8n+R8bUly/gaT+A75P4knyP9JzvdEUuV/
EneQ/yvfR/5Psl8Gk+yfQhI/IP8nlf8VDykuKR5W7CgeUVxWPKrYk1L+V+xV
XKvYp7hOsV9xvWIoblAcUNyo2ErhGvJ/ip+/gil+PgtVPk/+T+EF8n9KPf+l
+PlwSwofkv9TuJn8n+Lnz0KKn0/3pBAi/6f4+XYoxc+/pRRqyP8pzCf/p/j5
eiTFz9/lFO4n/6ewjfyf5uf7mrQ5/3ef/9M4ul/6P83vD740v1/UpbGb/J9G
F/k/ze8vSPP7TUMaE8n/adxK/k/z+5OVxmHyfxr3kf/T/H4WSvP7m51Glvyf
xgOU/2l+P9yS5vfHfBqTyP9pJMj/aX4/3ZPGIPlf8ZDikuJhxY7iEcVlxaOK
PRnmGsVexbWKfYrrFPsV1yuG4gbFAcWNiq0M76+0ZLCb/J/BjeT/DO/f2Bne
30lk8BatfwZF8n+G94/yGd5fGszgbfJ/BrXk/wzvXxUzeI/8n8G95P8M748N
Z3j/zMkgSv7P4Enyf4b350YzvH/nyeK75P8s1uzt+P2fNrv7f1mUyP9ZbCb/
Z7GN/J/l/Ud/lvcn6yvfR/7PIkH+z/L+ZyDL+6ONWXz2V+n/LO+vtmR5/zWY
xVnk/yweJ/9neX83kVX7v1ncTv7P4tvk/yzvLw9mef+5kMVE8n9W7f8rHlJc
Ujys2FE8oriseFSxJ6f2/xV7Fdcq9imuU+xXXK8YihsUBxQ3KrZyCJD/c3z+
Eszx+Uyo8nnyfw4vkv9z6vwnx+dDW3L4E/k/h0Xk/xyfPxVyfD61J4du8n+O
z7eGcnz+VcphHPk/hxvJ/zk+XxvJ8flbuXK/yP85PEj+H+DzvTED5u9/3t77
v5hC2PQ=
           "]]}, 
         {RGBColor[1, 0, 0], PointSize[0.005555555555555556], 
          AbsoluteThickness[1.6], LineBox[CompressedData["
1:eJxd209sI1cdwPEH6iFHC/XgQw8DQsgqCA1QWHe30F//gfnboUDXuxQYml0w
JEsnKUmdlISXzT/n/6gg5N7mguQTGgmEjCjwDkXKoQcLgRSJy3CLAKGROGB6
QAT5jZjfdy7RR2+fx/O0b7+ecfbdL7703N13GmPe8YAx//s5O8rHjT5Ecw5u
wA/CTfghOIDfA78Xfh/cgh+GPwB/EA7hD8Efhj8CPwJ/FP4YfA1ui7S3bprX
f+LX/VGJ/v3Qn09e/an3dYl/9MK1v+z9zPuGdLfe//DLj/zc+zFpv34Uxae/
9P64mOkv/vm+Z3/l/Qlp33h88cGVX3s/LuMb26/96T9veIv0N39/9srffjOz
FRm86+2Xe9d/68efwPgTmP+kdOqvb5+Upjr/U9Ktvz/7lETq/T8tUf367NOS
qOt/Rmx9fewzfv3Gj81+flKvp4XNpzAOmw7GYfNpjMPmMxiHzWcxDpvPYRw2
n8c4bL6Acdg8i3HYRNoCW9jB5ouYD1vYweY5zIct7GDzJcyHLexg82XMhy3s
YPMVzIct7GDzvASzv9+/m81/XmT2939m+7yEs/0xs7san+2fmc1N6cz2l59/
Uxqz/efn3xSZ7U8//2a1f/38brW//fxutf/9fIy7Lubfqva/n3+r2v9+/q1q
//v5t6r97+ffrva/n3+72v9+/m3J6uvjbvv1G78x+/lVrD9sYQebFzAftrCD
zdcwH7awg83XMR+2sIPNNzAftrCDTawdwALHsIUz2MEFbL6J88MCx7CFM9jB
BWxexPlhgWPYwhns4AI287r/wbzuv8xX+3/meF469X7aqz9f72s2X+3/md28
7nMxj37fEVvve3BH0nr/BePxHXH1+faORPXXz+5IoM5/R+L6+yuurPp/V5L6
9QV3JVXXf1dcfX3iu3793pz131au1h92cAGbb2kHsMAxbOEMdnABm2/j/LDA
MWzhDHZwAZsezg8LHMMWzmAHF7D5Ds4PCxzDFs5gBxew+S7ODwscwxbOYAcX
sFkQ82itb8GC7r8siK33MV6o9r/v40K1/2fOFmT6r1p/3YLuf7Eguer3YrW/
/fkXq/3vz4/xeFH33y5W+9+ff1Hm6v13i9X+9+dfrPa/P/89cfXrC+5V+9+f
/55k9fWJ7/n1e3PWf1u5Wn/YwQVsvqcdwALHsIUz2MEFbF7C+WGBY9jCGezg
AjaJdgMO4BAWOIJjOIEtnMIZnMMOnsAFXMJmSbsBB3AICxzBMZzAdkmCR2t9
S5d0/7MlSet9zJd0/92S7v9kSd//F0u6/+US+r8sg3rfG8syrPc/wHi4rPsv
y9Ktv360rO//42VJ6u8vWZae+vyyLEX9+tJlydT1X43X1ydf9uv31qz/rrI/
JnABl7B5WbsBB3AICxzBMZzAFk7hDM5hB0/gAi5h833tBhzAISxwBMdwAls4
hTM4hx08gQu4hM2KdgMO4BAWOIJjOIHtiu5/ulLtf9/TlWr/z5yv6P67Fd3/
yUq1/31vV/T9ebmC+/fVan/P3Fit9r/vMcbD1Wr/+z6vSlx//WhV3//Hq9X+
nzm5svr8slrtf3/9q5Kr61+t9r+//lW/fm/N+u8q+2MCF3AJm1e0G3AAh7DA
ERzDCWzhFM7gHHbwBC7gEjZ97QYcwCEscATHcAJbOIUzOIcdPIELuITNmnYD
DuAQFjiCYziB7Rr6v4b+r6H/a/r5uVvTz9cna+j/mr4/L9fQ/3VJVf/XJVP9
x3i4Lueq/+vSU/1f1/f/8br0Vf+vrPq/LqXq/7o4df1Xr3e93v91v35/8P2v
7I8JXMAlbF7VbsABHMICR3AMJ7CFUziDc9jBE7iAS9j8QLsBB3AICxzBMZzA
Fk7hDM5hB0/gAi5hs6HdgAM4hAWO4BhOYLtR7X/fvw2JVf82JFP939DPz92G
fr4+2dD338VG9fnc939D99tsVvvb939TRqr/mzJU/d+Uier/piSq/5vSUv3f
lIHq/6ZY1f9Nafy43v9NKdT1b4pcr/d/06/fH33/K/tjAhdwCZsfajfgAA5h
gSM4hhPYwimcwTns4AlcwCVsrPYc3ICbcAC34BBuwwJ34AjuwjHcgxO4D1t4
AKfwEM7gEZzDY9hZia/V+nZuJXi71r+J1f2/sLr/hZVmva+XVtr1/pZW359P
rb5/N1v6/n5uq9r//vPAlmT18eaWlPX5wZZ+vtDakrB+/nCr2v8zt7dkUn//
sqV/v6GzVe1//3niarze/+6WX7+/zvofV/ZHD07gPmzhAZzCQziDR3AOj2EH
n8MT+AIu4Eu4hKewua89BzfgJhzALTiE27DAHTiCu3AM9+AE7sMWHsApPIQz
eATn8Liy8/26L9m1Wt/Orzyt9W9yX8LXan28uK+//y+uXq/e18v7ktef/5f3
5eJ6rc/T+2JV/7elXe/73LZE9f43MN7c1vODbWnW+9/a1p8/wm0ph7X3196W
sP7+Zbv6/m/mzraYt2vXH21X/z7O3N3W6xnDPTiB+7CFB3AKD+EMHsE5PIYd
fA5P4Au4gC/hEp7CZkd7Dm7ATTiAW3AIt2GBO3AEd+EY7sEJ3IctPIBTeAhn
8AjO4THsdtD/HfR/p/r87/u/g/5f/XnV/x0R1f8d9H9H37+bXX1/P7cruer/
roxU/3dlqvq/q1+/tas/f4RXr6/6vyuF6v9u9f2m7/9utf99/3clU/3f9ev3
d9//yv7owQnchy08gFN4CGfwCM7hMezgc3gCX8AFfAmX8BQ2e9pzcANuwgHc
gkO4DQvcgSO4C8dwD07gPmzhAZzCQziDR3AOjytnvv97um/ne2JV//ckUP3f
0/0s9nRfL/ckU/3fk3PV/z3pq/7vS6j6vy8d1X+MN/f1/GBfGqr/+/r7h3Af
/d9H//erz/++//vo/76I6v++Xs8Y7sEJ3IctPIBTeAhn8AjO4THs4HN4Al/A
BXwJl/AUNgPtObgBN+EAbsEh3IYF7sAR3IVjuAcncB+28ABO4SGcwSM4h8ew
G6D/A/R/gP4P9O//FwP0f4D+D6rv53z/B9XzO9//g+r5nu//gYxV/w8kV/0/
EPNYvf8H+vVbB/r84YFkqv8Hcqn6f6Cvr3Ogrz86kEL1/8Cv3z98/yv7owcn
cB+28ABO4SGcwSM4h8ewg8/hCXwBF/AlXMJT2Bxqz8ENuAkHcAsO4TYscAeO
4C4cwz04gfuwhQdwCg/hDB7BOTyG3aHu2/mhJKr/h9JQ/T9E/w/R/0P0/xD9
P0T/j9D/I/Qf480j9P8I9/9HuP8/Qv+P0P8j3P8fof9HuP8/8uvnPz/Flf3R
gxO4D1t4AKfwEM7gEZzDY9jB5/AEvoAL+BIu4SlsjrXn4AbchAO4BYdwGxa4
A0dwF47hHpzAfdjCAziFh3AGj+AcHsPuGP0/Rv+P0f9j9P9YWqr/x9JR/T/W
389Pj+VC9f8E/T8Rp/p/ImPV/xOZU/0/0a/fOpFI9f9ERqr/JzJV/T+pfv/X
9/9ERPX/RIIb9f6f+PUrff8r+6MHJ3AftvAATuEhnMEjOIfHsIPP4Ql8ARfw
JVzCU9icas/BDbgJB3ALDuE2LHAHjuAuHMM9OIH7sIUHcAoP4QwewTk8ht0p
7v9P0f9T9P8U/T9F/0/R/1OZqP6f4vn/GZ7/n+H5P8abZ3j+f3a1P+v9P9P/
/zA8099PtM/09xdypn+/sXNW/fvn+3+mvx/pnvn189+fxJX90YMTuA9beACn
8BDO4BGcw2PYwefwBL6AC/gSLuEpbFLtB/7v/wJWLoff
           "]]}}, {}},
       AspectRatio->NCache[
         Rational[1, 5], 0.2],
       Axes->{True, True},
       AxesLabel->{None, None},
       AxesOrigin->{0, 0},
       DisplayFunction->Identity,
       Frame->{{False, False}, {False, False}},
       FrameLabel->{{None, None}, {None, None}},
       FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
       GridLines->{None, None},
       GridLinesStyle->Directive[
         GrayLevel[0.5, 0.4]],
       ImageSize->720,
       Method->{},
       PlotLabel->FormBox["\"Window Length = 41\"", TraditionalForm],
       PlotRange->{{0., 1025.}, {-1., 1.}},
       PlotRangeClipping->True,
       PlotRangePadding->{{
          Scaled[0.02], 
          Scaled[0.02]}, {
          Scaled[0.05], 
          Scaled[0.05]}},
       Ticks->{Automatic, Automatic}]},
     {
      GraphicsBox[{{}, {{}, {}, 
         {GrayLevel[0], PointSize[0.005555555555555556], Thickness[Tiny], 
          LineBox[CompressedData["
1:eJxd2nl8lNW5B3Da0oq21nhdCO31dnArWsWoqGERfoBgFNAoAgFZhoSEQFgm
+2R/Z99ncq33SluFERXBBSKiRot1rveqqQvEBUhQcACBiFuslmLr59q5vud8
7vM7/MPnvJMz73ve8zzP933PmZGla+8s/+GQIUN+MHTIkP/73/43OOm0hede
e+mmp3aqA+jbd+aX5b/aMsluDsMPd1y2c9Pw51U7D5OWJtfk9bys2ufijE0r
JnSf6lHtfJy7ZGTLNyN2q/a/4rv1e0b/5N53VNuB9371eP3vU3tU+0JUbNm6
6XBbn2pfjMzCQ6fnLXpftS/F2JM/KVz0m4OqPQqffHfh70K1WdW+HK9Ubh07
/rVDqn0FClyHvv3bWUdUezT2XnD6JV/N/Ei1C7Dh0/iYFW1HVftqvDG+o2J9
+phqX4Mntq288MNnjqv2tbhx+HlV1s4B1R6DyaGvbs4+/bFqX4eHHvz5ZRV/
OKHa1+PGNSOm+Wo+Ue0bsO1F68vthZ+qdiGqX5vwdfNnuj0WNyWu2V3V+Zlq
j8PR4MmhI0d+rtrjsf/KV+dO3qDbE7C34J5/tJ/xhWrfiG0L/7b7vlLdnojz
HxnWMedR3Z6ESy95+6FEn24D7aubjow8qdoWYB8fVJ9PNj6fbPSfgnz5/dYU
bKfzT8V+eX3WVPTT9d+Ej+T4rJswncY/DbXy/ljTsJ3u33RMkvfXmo5NdP9v
xjQ5P9bNmE7zV4Rn5PxaRXiP5v8WPCDjw7oFeyh+bsUYGV/Wrfgzxd8MDMr4
tGZgCsXvTLwu49uaCRfF/yx8JvPDmoURG2T+3IYzZH5Zt2EI5d/tuE7mp3U7
RlP+FuPqPpHfKMYZ0fUzxza9MMH++2K8Zuf/S9+3M8X45unv+9vtIXfgl/b3
223cgWOPfH9+u23dgcHF31+f6n8HzrSvX/W/E4fs8an+d2KZPX7V/078yb4/
qv+duMG+f6r/bJyw76/qPxv/Y99/1X82rrLnR/WfjV57/lT/u7DOnl/V/y70
2vOv+t+Fp+z4UP3vwhQ7flT/OTr/Vf852GjHn+o/BxPs+FT95+j8V/3nwmXH
t+o/F1Pt+Ff95+KwnR+q/1zss/NH9Z+HPju/VP95eMrOP9V/Hobb+an6z9P5
q/qX6PxW/UtgHx9U/Y3PMyVG//k6/1X/+Tr/Vf/5Ov9V//k6/1X/BTr/Vf8F
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
kv9tev9P1f82PEj+t+n9PzX+NlxL/rdhPfnfhgLyvw2Pk/9tvL7d2abzX42/
Tee/Gn8b9pD/bXr/T42/Tee/Gn+b4X+bzn81/na0kf/tsI9r/9sN/9sN/9sN
/9sN/9vxAfnfbvjfjk/J/3bcQuNv1/mvxt+u81+Nv12vr6rxt+Mx8r9dr8+q
8bdjBvnfodd31fg7sJ/mvwMPkf8dOE7+d2A8+d+BA+R/B06S/x0YQ/53oI/8
78BSiv8OfEv+d+B08r8DFeR/B/6N/O/Ab8n/Dqwi/y08If0fZqn1v722/3kW
Zkj/8y3slP47LEyQ9WWUhR7pf4GFs2V9KrTwofQfFt6R9a3IQqGsf8VWLp5E
fSyxcKasn04LR2R9rcz9vay/LgtTZX12W8b6rYV7ZH0PW9gh63+npfeH7PY6
i/f/0xaukb5sthCX/nRZvD7dben8V/XbQoX0rcfCLOlfr8X7432Wzn9V3y3s
kr4OWLz+Pmix/6csw38PWqXvwzywjyv/8zzokJ/ne3CZ7O/w4Fz5/aM8ev9R
zb9H57+afw+OyuuHh/c3ijw6/9X8e9Au70+JB6/I++f06P1VNf8ePC7vv8uD
2XJ+3B7cQPs3Hr2/q+bfo/Nfzb8Hf5Txsc7D+0fp3PllfG324KCMvy4Pzhly
0f/HZ7cH19Pza+58Mr57PFgv47/Xg5dlfvR58FPpf9aDlTK/BjxIS/8HPRgh
8/OUB3XkvxcvSv+HebHxu+TIC84+afuf58VY6X++F09L/x1ePO8U9WWUF5Nl
/Snw4meyPhV6cUD6Dy/ulfWtyItqWf+Kvdgq62OJFz+V9dPpxf/K+lrp5f1X
lxejZH12e7GT1m+92CLre9iLP8v63+lFWvqwLvd90o+0l/eXN3vxgPSny4ur
pE/dXrxAfnn171vsdo8XkP71etEvfezz4qD0M+tl/we87P+gF2dLn095jf17
H/s/zAf7uPI/z/g838f9HT72f5QPz8nzF/jwnry+Qh8+kNcPHz6T4yvyYa4c
f7FP/z5Kzb8Pz8r75/Rhlry/lT78Tt5/l49/n+H2YSbt3/jwmpzfsA+v0Pz7
8LCMj3U+fCzjJ527Xhlfm338+5MuH07J+Oz2wUXPrz5slPHd40O5jP/e3Hw4
RH70+TBD+p/14Su5vzbgw69l/g36cL/0/5QPrc9I//3YLff3hvnV+v9+5b8f
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

           "]]}, 
         {GrayLevel[0], PointSize[0.005555555555555556], Thickness[0.01], 
          Opacity[0.5], LineBox[CompressedData["
1:eJxd2n98HHWdx/FRq6Roj+UACedxLuXEHHJ1lQJpqfQNihcEZNuiBuyPabFp
UrWdmtQsl5RMfm82m01OubPnQ9uhQi9VrixSuIBV5rgDI0K7Ii1pkXbaQhs5
zltEueDxOC6yk8d93m/+4fFkM91u5vv9vGZnuGDNxqVr3+k4zjtmOc4f/135
p7z4tOVnX3rRzvv3xv8BE8/NeXXtB3ctrrAK79zzV3t3nvtw7AQWry5sSIw/
FvtsnL6zadHY1Hjsapy96oK2N87bH/vP8da2A/Pec+czsZN49oM/2Pzt4QOx
56Jh1+6dx7dMxP5LhMuPzU6seD72RVjw+ntqV3zkSOwa/Mdbc/+xvzmKfTEe
b9y94MqfHot9CVLesTf/+4wTsefh4PmzP/TaDS/GTmH7K/n5TVteiv0x/PzK
joZtwcnYH8e9962fe/TBU7EvFc8XXya+XHyFuFa8QLxQfKV4kfgT4qvEi8Vg
+2Lnanld7Fwjr4udT8rrYudT8rrYuVZeFzufltfFzt/I62KnTl6vw7N0/q/D
d+368K/DAVo/n8F8u778z+BntP6uR9muT/96XEPr9wY8ade3fwM8Wv834j/t
/vBvxHnb7f75LE63+8v/LBzafzfhMrs//Zswj/ZvGh+bMPsbaZye23bDgtsf
WVT5+TR+Wtn/j77tMI03Hnj7+IqdJfhA5c+vGEtw8p63379ifwnKK9/++8XH
L8Gcyt8/Pn4pjlU+X3z8Unyp8vnj45fiJ5XfT3z8UlxR+f3Fxy/Dy5Xfb3z8
Mvx75fcfH78MH62cn/j4ZShVzl98/M3YWjm/8fE3o1Q5//HxN+P+yvqIjxc7
n2ND7ItDsfN5OV7si0Ox8wU5XuyLQ7FTL8eLfXEodm6R48W+OBQ7t8rxYl8c
ip0vyvFiXxyKneVy/HIcoPO/HNvs+giXz/QjPn4FLrPrCyvwJK2/FXjVrs9w
BT5F63clnrLrGyvxNVr/K/Ffdn+EK/EB2j+r8CerzP7CKszaafffKiy0+zNc
hSv22P3r4poJs7+TLir9/9dK/+HiQdt/18WrD5j54bs4186XwMXxe8z8CV28
stLMp8jF6TS/VuOonW/J1Vhj5x9WY6+dj+5qXGbnp78av7bzNViNf7PzN1yN
eXY+R6uxn+b3GnzLzvfkGuy38x9rULR9cMW+OBCH4kjs3MZOiiF2xb44EIfi
SOx8Sd5fDLEr9sWBOBRHYmetvL8YYlfsiwNxKI7EToO8fwMO0vlv4OtDt4Gv
H/0GXG7XV9CAn9P6a8Bv7fqMGvBp6v867LPrO7kOLbT+1+G3dn+463C+3T/+
Opxl+x+sw2zb/3AdrrL7M1oHUP8bcbPtf7IRs5sPPXrfGU9U+o9G3G377zZi
0vbfb8Sf2vkSNOIF2/9w+udt/6NGvLzNzq8mvGDnW7IJ19j5hyY8Yuej24Rz
7fz0mzBp52vQhP12/oZN+Gs7n6MmHKb5vR7/YOd7cj322fmP9bjH9sEV++JA
HIojsfNldlIMsSv2xYE4FEdi5yvy/mKIXbEvDsShOBI7X5X3F0Psin1xIA7F
kdjZIO+/Ac/R+d8ws//j99+AF+368TfgCru+gg04ROtvA16z6zPagEuo/xtR
sus7uRG30PrfiN/Z/eFuxDts//2N+Jztf7ARc2z/w43osvsz2og66r+HtYfM
/k548fX/k5X+Jz18w86HlIejtv/wcKOdL2kPh2z/XQ9z7XzyPEza7/++h+ft
fBvxADv/Ag9jdj4WPZxj52fo4ZSdryUP++z8jbyZ/V9xefrvR/3fNLP/K05s
wtN2/ic34W7bh5QY4rTYFXtiXzwiDsRFcSguiSNxWex8jZ0QJ8UpMcRpsSv2
xL54RByIi+JQXBJH4rLYaZbP34wJOv/NCOz6SDXP7P/48zej1q6vdDMO2/Xn
NuN3dn16zZhH16/NeMau75FmfJHWfzNet/uj2Ix32f6HzbjF7q9SM860/Y+a
0Wf3Z7kZS6j/LWg9ZPZ3ogXvu+u2Q48d31fpf7IFvv1+kGrBQdt/tOA6O1/S
LThg+++24Hw7n7wWvGT777fgkJ1vIy24ys6/oAUP2flYbMFZdn6GLThp52up
BU/b+Ru14BI7n8stmKD+b8bf2/me2Dyz/+N5vBnfs31IiSFOi12xJ/bFI+JA
XBSH4pI4EpfFztfZCXFSnBJDnBa7Yk/si0fEgbgoDsUlcSQui51W+fytM/s/
/vytuMuuj1QrXrLrB61YYNdXuhXP2/XntuL3dn16rUjR9WsrnrXre6QVK2j9
t2LK7o9iK95t+x+2YqXdX6VWvN/2P2pFzu7Pcitupf5nkKX+Z+Lv/7+I+5/B
Bup/Bk9T/zO4lvqfQYn6n8F51P8MTlD/M3iO+p/BIpp/Geyh/mdwJvU/g5eo
/5mZ/R/Pvww+Qv3PzOz/eP7djjup/7fjKZr/t2MH9U8McVrsij2xLx4RB+Ki
OBSXxJG4LHb+lp0QJ8UpMcRpsSv2xL54RByIi+JQXBJH4rLYaZPP34ZDdP6n
X6f+t+Ek9b8NC6n/bfgV9b9tZv/Hn78NH6f+t+Eg9b8Nq2j9t+EP1P82nEb9
b8Ma6n8b/oz634Zh6n8bbqP+t+Pb1P92ZE99/Y2XD/8y7n87VlD/2/E49b8d
oP634ynqfzvOof634xj1v33m+V88/9qxkOZfO35I/W/HGdT/drxI/Z9+f+p/
Oy6m/rfjOer/FnyT+r9l5vlfPP+34C7qnxjitNgVe2JfPCIOxEVxKC6JI3FZ
7NzBToiT4pQY4rTYFXtiXzwiDsRFcSguiSNxWex0yOfvwGE6/x34HvW/A6eo
/x24kvrfgReo/x14nfrfgfnU/w5MUP87sJrWfwfepP53YDb1vwMN1P8O/AX1
vwPfpP534CvUfx/32v5X+fH9v4OV/id8XG/7X+1jr+1/0sciO19qfIzb/qd8
nGnnU62Po7b/8PGMnW91Pmrt/Ev7KNr5WO9jjp2fro8Tdr42Tv+8nb+ej0/a
+Zzx5f6tj2/Y+Z71scfO/xF/5vlQxVvFgXhUXBSPiUPxuLgknhBH4klxWTwl
djrZVeKEuFqcFNeIU+JaMcR14rS4XuyKG8WeOCP2xdnOmf0fn/9O/Miuj62d
/Pwo6MQiu75GO3HErr9iJ85yLvz/9TnWicvp+nX6/ez6Hu/ENrv+S514zO6P
iU681/Y/6sR6u78mOxHY/pc7cZ7dn1OdaKH+d+HHtv9VXdjxVuGC8898vdL/
RBcW2P5Xd+EB2/9kFx52zXyp6cLVdv6kuvA+O59qu/CC7T+6cKedb3Vd2GTn
X7oLu+18rO/Ce+38dLvwv3a+Nnbx81evCzV2Pme6sJfu33Zhl53v2S78zM7/
kS4Etg9bxYF4VFwUj4lD8bi4JJ4QR+JJcVk8JXa62VXihLhanBTXiFPiWjHE
deK0uF7sihvFnjgj9sXZbjxO578bd9v1sbUbv7brJ+jG5+36Gu3m//+k2I0p
uz7HuuHR9Ws3dtj1Pd6NtXb9l7rhJM3+mOjG9bb/UTdes8/XJrvxYbv/yt34
ju3/VDfaH7T978F++3yvqie+/3847n8Pag7a/vdgl50fyR5cSv3vwaPU/x7k
7fP/2h5U2/mFHuyj/vdgPvW/B83U/x5cTf3vwXHqfw92U/+nf57634Nnqf89
+Dvqfw9+SPN/2tR/cSAeFRfFY+JQPC4uiSfEkXhSXBZPiZ1edpU4Ia4WJ8U1
4pS4VgxxnTgtrhe74kaxJ86IfXG2F7+i89+LH1P/e/EL6n8vPkH970VE/e/F
OdT/Xiyk/vfiCPW/Fzuo/714gvrfiwT1vxfN1P9e7KL+92Iu9b8XfdT/Phyj
/vdh4eaO151dx+L934f3U//7sIP634ci9b8PtdT/Psyi/vfhEPW/DyPU/z58
lfrfh+9T//twGvW/D29S//swTv3vw0XU/z78iPrfh1Hq//TxNP/7sJ36Lw7E
o+KieEwcisfFJfGEOBJPisviKbHTz64SJ8TV4qS4RpwS14ohrhOnxfViV9wo
9sQZsS/O9uMJOv/92En978fL1P9+1FP/p4+n/vfjD9T/frRQ/6f/fOp/P5qo
//2YRf3vx03U/378D/W/Hx+l/vfjHup/P4ao/1m8Rv3Pxs//jsT7P4t3U/+z
2Er9z+Ji6n8WD1H/s+im/mdxNvU/iyep/1mkqP9ZbKT+Z3EV9T+LiPqfxb3U
/ywWU/+zeIb6n8Uw9T+LIs3/LPZQ/8WBeFRcFI+JQ/G4uCSeEEfiSXFZPCV2
BthV4oS4WpwU14hT4loxxHXitLhe7IobxZ44I/bF2QEcofM/gJ9Q/wd4/QQD
vL5GB3Cc+j+Ac6n/A7x+w+mfp/4PYCf1f4D3x8QA759oAO3U/wHcT/0f4P05
NYBvUf9zmHXY9j+HCwdfPXXs2qn4+3+O50N1DiPU/xz+ifqfQ4r6n+P5VJvD
Aep/Dnnqf47nXzrH87E+h3dR/3M8XxtzPH+9HD5E/c/hYep/jud7NifzP4fv
Uv/FgXhUXBSPiUPxuLgknhBH4klxWTwldgbZVeKEuFqcFNeIU+JaMcR14rS4
XuyKG8WeOCP2xdlBuf4b5OvDrYN4hfo/iFup/4N8/Vkc5OvTsUFkqP+DfH07
PsjXv6VBVFH/B7GM+j/I19eTg3z9XR7EP1P/B7Gd+p/n6/uqfPz8f+b6P4/j
B2z/8/z9IZnn7xc1eeym/ufRRv3P8/cX5Pn7TV0el1D/8/gy9T/P35/cPI5Q
//P4AfU/z9/PMnn+/ubnUaD+53Efzf+8fP8XB+JRcVE8Jg7F4+KSeEIciSfF
ZfGU2BmS7//ihLhanBTXiFPiWjHEdeK0uF7sihvFnjgj9sXZIRyl8z+EkPo/
xPePgiG+vzQ6hBPU/yFUU/+H+P5VOIST1P8hfJ/6P8T3xyaG+P5ZNIQe6v8Q
HqH+D/H9uakhvn/nFPBh6n8Bm/a2/PI3d8zc/yugRP0v4A7qfwHbqf8Fvv+Y
KvD9ydrpP4/6X0CW+l/g+5/pAt8frS/grd/b/hf4/mpjge+/egVcSP0v4F+o
/wW+v5styP3fAr5D/RcH4lFxUTwmDsXj4pJ4QhyJJ8Vl8ZTYGWZXiRPianFS
XCNOiWvFENeJ0+J6sStuFHvijNgXZ4fl+c8wPx/aOozfUP+HsZz6P8zPn4rD
/HxqbBjt1P9hfr41PszPv0rDmEP9H8YXqP/D/Hxtcpifv5WH8RD1fxj3U/9H
+PnerJH4//85sff/AKJM31k=
           "]]}, 
         {RGBColor[1, 0, 0], PointSize[0.005555555555555556], 
          AbsoluteThickness[1.6], LineBox[CompressedData["
1:eJxd2n9sJOddx/EhOoElTmhVHZL/COoURciqIljSlG7hoJ+0l8bAQZeQH5vk
kgx3ZzB3Nlmb2LGd2n38Y+317xWKqhU6VfNHi/wHVVdtFKwSYBRdwYgDFhSQ
QVU0qoJklQitxAFGqhBL5xnxfN/+J3pl7pnZmceP3zuz+5Hrrzw58UAURT9w
IYr+77/Fz+BTkf2R5QhcgS/Bo/CDcAz/OPwQ/BPwGPxR+GH4J+Eq/NPwI/DH
VFn8g51Lt1J/nR5VfXG/8aH8a94f1/Hhhz9ee/iPvH9G7ftzP/qRf/kT70/o
Yq1x+XM//I53TZdeHn/ilffuen9SyfyHv/HIrb/w/lm9f+2ndn7oq3/p/XM6
Pp/+u/ZX/sr7so4ufOnmF578a++f18U3H3nrO1//G+9f0NE/vDb7T9/6W+9P
6f537z3w4uN9b+nLr//YWst5O+ko/egfP/ZGuf0xbH8M4z+tXrh/92mNmuN/
Rsfh63Of0Zvm9V9RHp6fu6JJc/6P68Hw+rjHNWqu32fVDa+v+6z65vo/oU44
P+4JpWb+xv38/v3lYnvp8ucXrR0c/RK2w9EvYzscXcV2OPoVbIejX8V2OPoc
tsNR3VqwgzM4+jWMhx2cwdGTGA87OIOjX8d42MEZHD2F8bCDs6fK9f9nxf94
WlHx+1VYT6td/P4Vdk+rUfx+Fs6e1vknvv/768c/o++99P3fbz/+GY0Xv/9+
/DO6W6wPP/4ZdYv148c/qzvF+vLjn1VUrD8//ll1i/Xpxz+r7xbr149v6PeL
9e3HN/SlYv378dieNTD+Od0J96/ndMEc/zl9OXx92XNKzet/XvfC89Pzesqc
//O6+HJwfbLndaEWXr8XtBBeX72gI3P9X5DC+cleGP69Dufvmp/fu28X40uX
8w9ncPSitWAHZ3D0EsbDDs7g6GWMhx2cwVFiHcOCE9jBKZzBORz9Bo4PC05g
B6dwBudwdB3HhwUn123/3fVy/RdOr5frv3B2vVz/hfPr5fr3/bmhKOxbfENX
w/7pRrn+Cyc3dCfsp7uhNOxreqNc//74N8r16Y9/o1y//vg3dSfse3xTadh/
YXtyUx+E493w34f7T29qxBz/pn1/kg9t+j+hd8Pziyd0zZz/hCrh9Ukm7Psn
NyEXXt90wr7/yiaUhPOTT6hp+v+bfn7vFf2PS5fzDyewg1M4g3M4+i3rGBac
wA5O4QzO4WgSx4cFJ7CDUziDczj6bRwfFpzADk7hDM7h6BaODwtObqkX9sPd
Gv49CPqS3lIe9ie7pWbYp/yWHjL9uq0rYd/i23o17J9u68KLQR+T2zoJ++lu
617Y1/S24rC/2W3dDfuc39b/mH5P6eth3+MpvRX2X9ieTCn612C8m9K9cP/p
lMbM8af0bvj68qFN/6d1KTy/eFptc/7TaoTXJ5lWLbx+blppeH3TaY12wus/
LRfOTz6t6lLY/9/x89sv+h+XLucfTmAHp3AG53D0inUMC05gB6dwBudw1LSu
wDFchQXX4QRuwg7uwCncgzO4D+fwAI5mrCtwDFdnlIX90Ey5/gvXZ8r173s1
U67/ws2Zcv37fs1oPOxbZ0YLYf/SGY28GPSxN1Ouf9+3mXL9F+4P9x/2Nx/+
+7DPg5ly/fr+zerNsO+VWR2H/Y+xvTqrB8LxmlU/3H99VtXw+Mmsvh2+vuas
Ts37l1k9GJ5fZ1Z75vxnlYTXpzcrhdcvm9VReH37s4o7wfXPZ4f3+8H8DGZV
Xwr7/7t+fv39f6V0Of9wFRZchxO4CTu4A6dwD87gPpzDAzh61boCx3AVFlyH
E7gJO7gDp3APzuA+nMMDOJqzrsAxXJ0r17/v05zisC/1OZ2F/U/mbP+bcxoz
/Zor13/hzpw+H/YvndPFsI+9Od0L+5nNqR/2tT9n+5vP2T4P5sr16/s3r7fC
vlfm9c2w/zG2V+d1IRyveZ2G+6/P69Hw+Mm88vD1NYc271/mFYfn15nXG+b8
53UzvD69eV0Jr182r+Pw+vbnVQ37n88P368F8zOYV2L6/5qf338s+l8pXc4/
XIUF1+EEbsIO7sAp3IMzuA/n8ACOFqwrcAxXYcF1OIGbsIM7cAr34Azuwzk8
gKNF6wocw9VF9H+xXP++f4vl+vf9WyyfT/n+LZbr3/dvUVdN/xfL9e/7t1iu
f9+/RfVN/xfL99e+f4vl+vf9W7R9HizafkdLOjb9X9Lbpv/YXl3SD5r+L+nb
pv9Lqpn+L+l90/+hTf+X9JDp/5K65vyXNGX6v6Srpv9Lykz/h8c3/V9S3/R/
Sc70/3U/v//s+1+6nH+4CguuwwnchB3cgVO4B2dwH87hARx93roCx3AVFlyH
E7gJO7gDp3APzuA+nMMDOFq2rsAxXF1G/5fR/2X0f9k+n24uo//L5fr3/VuW
M/1bVsX0f7lc/75/y/b+ur+sh03/h9tN/5dtv6OVcn37/q/oT03/V/RN0/8V
jZj+ryg3/V/RZdP/FX1g+r+iM9P/FT1s+r+i1Jz/ipqm/yuqm/6vqG/6v6Jx
0/8VDUz/h/s3/f+Cn9/3fP9Ll/MPV2HBdTiBm7CDO3AK9+AM7sM5PIAjZz0C
V+BROIbH4CpcgwWPw3W4ASfwJNyEF2AHt+FO6btFH7pO2ULQj9SpshD05cjp
9CDoT8/Z/h87nYXP/zOnd18K+nbi1Az713fl52OFT506YT9zp1fDvp658vM3
3zunN8I+nzu9b57/r+qLYd9HVsvP//z7gVX7/H90VYNwfLyqvXD/Y6v284fq
qv4wfH21Vfv+RavKwvMbX7Xff6iv6tGw/43Vcv379xer9vOVyVX7+X9zVfFS
MD8Lw/2H8+dWMf9wB+7CKXwE9+BjOINP4D58CufwGTyAz+FozXoErsCjcAyP
wVW4Bgseh+twA07gSbgJL8AObsMduLsmtxD0I11TfSnoy9Ga7X9vzfb/eE2T
pl9rtv8na7b//bXy+z+FT9d0HvYzX9Np2NeztfL5m+/dmn3+f76mi6b/67bv
I+vKwv5XsH103Y6P1/V+uP+xdV0Lj19dt88nausahK9f63o07P/4uk7D86+v
289HGutqhNcvWdfkfwTXd3JdJ+H1b66rEs7PwvD8wv679WJ+3b8X/W+vY/7h
LpzCR3APPoYz+ATuw6dwDp/BA/gcjjasR+AKPArH8BhchWuw4HG4DjfgBJ6E
m/AC7OA23Cl97Pu/oY7p/4YGr4X939CJ6f+GJk3/N5Sb/m/onun/hv3+W3+4
P9P/DbVN/zfUNP3fsP0dbNg+n2/oO6b/Lb1h+t/SHdP/Vvn9H9//lv7N9L+F
/rf0vW+E/W/Zz/9rLfS/hf630P8W+t9C/1vofwv9b6lq+t9C/1uYf7gDd+EU
PoJ78DGcwSdwHz6Fc/gMHsDncLRpPQJX4FE4hsfgKlyDBY/DdbgBJ/Ak3IQX
YAe34Q7c3VTT9H9TMv3fRP830f9N3TT930T/N9H/4f5M/zfR/030fxP930T/
N/Ujpv9betv0f0vvmP5j++iWHR9v6cz0f0uJ6f+WfX21Lfv6taWa6f+WctP/
Lfv5SGO4f9P/LS2Y/m/Z7180t8r17/s/3G76v1XMr7vv+7+F+Ye7cAofwT34
GM7gE7gPn8I5fAYP4HM4aluPwBV4FI7hMbgK12DB43AdbsAJPAk34QXYwW24
A3fbth9pW5npf1s90/+26qb/bb1r+j8cb/rftt9/67f1tul/W870v62bpv9t
3Q/7O2hrw/S/rfdM/7fVMf3fVtf0f9s+Hxjdtt8fjLft/se27fGr2+X3f33/
t+33F7Rtz298255/fVtV0/9t+/w/2bbXd3K7fP/v+7+N+/9t9H8b8w934C6c
wkdwDz6GM/gE7sOncA6fwQP4HI52rEfgCjwKx/AYXIVrsOBxuA434ASehJvw
AuzgNtyBuzu4/9/B/f+OBqb/O+X3U33/d3D/Pxxv+r+jDdP/HX1g+j98Pf8d
9n/Hfr5+tlN+/ub7v2M//z/f0YdM/3eVmf7v6s9N/7F9dNeOj3d13/R/V1Om
/7v29dV27evXrq6Y/u/qzPR/V0+Z/g/3b/q/q47p/67OTf93lZj+7yp+Pez/
bjG/7j99/3cx/3AXTuEjuAcfwxl8AvfhUziHz+ABfA5He9YjcAUehWN4DK7C
NVjwOFyHG3ACT8JNeAF2cBvuwN099H8P/d9D//fs/enxnk5N//d01/R/z97/
9vfs/fHpnjZM//c0Zfq/Z++/B3u4/9/D/f++fs/0fx/3//u4/9/H/f8+7v/3
8fx/H8//98vv//r+79vnG+P79vlHfV+XTf/3y+d/vv/79vnK5L79/mVzv/z7
7Pu/b5/fuH0/v/75Trt0Of9wF07hI7gHH8MZfAL34VM4h8/gAXwORwfWI3AF
HoVjeAyuwjVY8DhchxtwAk/CTXgBdnAb7sDdA/T/AP0/wP3/Afp/gP4f2L6d
HKD/B+j/Afp/gP4foP8H5fd/fP8PdMn0/1DvmP4f6sT0H9tHD+34+FDnpv+H
apr+H+rM9P9QI6b/h7pq+n+ogen/oa6Z/h9qwfT/UKnp/3D/4ef/zUN1TP8P
JdP/w2J+3X/5/h9i/uEunMJHcA8+hjP4BO7Dp3AOn8ED+ByOOtYX/t//C6Vj
FCA=
           "]]}}, {}},
       AspectRatio->NCache[
         Rational[1, 5], 0.2],
       Axes->{True, True},
       AxesLabel->{None, None},
       AxesOrigin->{0, 0},
       DisplayFunction->Identity,
       Frame->{{False, False}, {False, False}},
       FrameLabel->{{None, None}, {None, None}},
       FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
       GridLines->{None, None},
       GridLinesStyle->Directive[
         GrayLevel[0.5, 0.4]],
       ImageSize->720,
       Method->{},
       PlotLabel->FormBox["\"Window Length = 61\"", TraditionalForm],
       PlotRange->{{0., 1025.}, {-1., 1.}},
       PlotRangeClipping->True,
       PlotRangePadding->{{
          Scaled[0.02], 
          Scaled[0.02]}, {
          Scaled[0.05], 
          Scaled[0.05]}},
       Ticks->{Automatic, Automatic}]},
     {
      GraphicsBox[{{}, {{}, {}, 
         {GrayLevel[0], PointSize[0.005555555555555556], Thickness[Tiny], 
          LineBox[CompressedData["
1:eJxd2nl8lNW5B3Da0oq21nhdCO31dnArWsWoqGERfoBgFNAoAgFZhoSEQFgm
+2R/Z99ncq33SluFERXBBSKiRot1rveqqQvEBUhQcACBiFuslmLr59q5vud8
7vM7/MPnvJMz73ve8zzP933PmZGla+8s/+GQIUN+MHTIkP/73/43OOm0hede
e+mmp3aqA+jbd+aX5b/aMsluDsMPd1y2c9Pw51U7D5OWJtfk9bys2ufijE0r
JnSf6lHtfJy7ZGTLNyN2q/a/4rv1e0b/5N53VNuB9371eP3vU3tU+0JUbNm6
6XBbn2pfjMzCQ6fnLXpftS/F2JM/KVz0m4OqPQqffHfh70K1WdW+HK9Ubh07
/rVDqn0FClyHvv3bWUdUezT2XnD6JV/N/Ei1C7Dh0/iYFW1HVftqvDG+o2J9
+phqX4Mntq288MNnjqv2tbhx+HlV1s4B1R6DyaGvbs4+/bFqX4eHHvz5ZRV/
OKHa1+PGNSOm+Wo+Ue0bsO1F68vthZ+qdiGqX5vwdfNnuj0WNyWu2V3V+Zlq
j8PR4MmhI0d+rtrjsf/KV+dO3qDbE7C34J5/tJ/xhWrfiG0L/7b7vlLdnojz
HxnWMedR3Z6ESy95+6FEn24D7aubjow8qdoWYB8fVJ9PNj6fbPSfgnz5/dYU
bKfzT8V+eX3WVPTT9d+Ej+T4rJswncY/DbXy/ljTsJ3u33RMkvfXmo5NdP9v
xjQ5P9bNmE7zV4Rn5PxaRXiP5v8WPCDjw7oFeyh+bsUYGV/Wrfgzxd8MDMr4
tGZgCsXvTLwu49uaCRfF/yx8JvPDmoURG2T+3IYzZH5Zt2EI5d/tuE7mp3U7
RlP+FuPqPpHfKMYZ0fUzxza9MMH++2K8Zuf/S9+3M8X45unv+9vtIXfgl/b3
223cgWOPfH9+u23dgcHF31+f6n8HzrSvX/W/E4fs8an+d2KZPX7V/078yb4/
qv+duMG+f6r/bJyw76/qPxv/Y99/1X82rrLnR/WfjV57/lT/u7DOnl/V/y70
2vOv+t+Fp+z4UP3vwhQ7flT/OTr/Vf852GjHn+o/BxPs+FT95+j8V/3nwmXH
t+o/F1Pt+Ff95+KwnR+q/1zss/NH9Z+HPju/VP95eMrOP9V/Hobb+an6z9P5
q/qX6PxW/UtgHx9U/Y3PMyVG//k6/1X/+Tr/Vf/5Ov9V//k6/1X/BTr/Vf8F
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
kv9tev9P1f82PEj+t+n9PzX+NlxL/rdhPfnfhgLyvw2Pk/9tvL7d2abzX42/
Tee/Gn8b9pD/bXr/T42/Tee/Gn+b4X+bzn81/na0kf/tsI9r/9sN/9sN/9sN
/9sN/9vxAfnfbvjfjk/J/3bcQuNv1/mvxt+u81+Nv12vr6rxt+Mx8r9dr8+q
8bdjBvnfodd31fg7sJ/mvwMPkf8dOE7+d2A8+d+BA+R/B06S/x0YQ/53oI/8
78BSiv8OfEv+d+B08r8DFeR/B/6N/O/Ab8n/Dqwi/y08If0fZqn1v722/3kW
Zkj/8y3slP47LEyQ9WWUhR7pf4GFs2V9KrTwofQfFt6R9a3IQqGsf8VWLp5E
fSyxcKasn04LR2R9rcz9vay/LgtTZX12W8b6rYV7ZH0PW9gh63+npfeH7PY6
i/f/0xaukb5sthCX/nRZvD7dben8V/XbQoX0rcfCLOlfr8X7432Wzn9V3y3s
kr4OWLz+Pmix/6csw38PWqXvwzywjyv/8zzokJ/ne3CZ7O/w4Fz5/aM8ev9R
zb9H57+afw+OyuuHh/c3ijw6/9X8e9Au70+JB6/I++f06P1VNf8ePC7vv8uD
2XJ+3B7cQPs3Hr2/q+bfo/Nfzb8Hf5Txsc7D+0fp3PllfG324KCMvy4Pzhly
0f/HZ7cH19Pza+58Mr57PFgv47/Xg5dlfvR58FPpf9aDlTK/BjxIS/8HPRgh
8/OUB3XkvxcvSv+HebHxu+TIC84+afuf58VY6X++F09L/x1ePO8U9WWUF5Nl
/Snw4meyPhV6cUD6Dy/ulfWtyItqWf+Kvdgq62OJFz+V9dPpxf/K+lrp5f1X
lxejZH12e7GT1m+92CLre9iLP8v63+lFWvqwLvd90o+0l/eXN3vxgPSny4ur
pE/dXrxAfnn171vsdo8XkP71etEvfezz4qD0M+tl/we87P+gF2dLn095jf17
H/s/zAf7uPI/z/g838f9HT72f5QPz8nzF/jwnry+Qh8+kNcPHz6T4yvyYa4c
f7FP/z5Kzb8Pz8r75/Rhlry/lT78Tt5/l49/n+H2YSbt3/jwmpzfsA+v0Pz7
8LCMj3U+fCzjJ527Xhlfm338+5MuH07J+Oz2wUXPrz5slPHd40O5jP/e3Hw4
RH70+TBD+p/14Su5vzbgw69l/g36cL/0/5QPrc9I//3YLff3hvnV+v9+5b8f
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

           "]]}, 
         {GrayLevel[0], PointSize[0.005555555555555556], Thickness[0.01], 
          Opacity[0.5], LineBox[CompressedData["
1:eJxd2n+QXWV9x/GjRlnQ1EsBWVTqATu6tQy9CsgmpvCBil0LyE3QuihJTsAk
N/7IHtzFvXZX9tnfd3/faZ3p1unAKVPSjdr0UpBZmbSc0oo7jMItGtzgACeh
wha1vYhmFnVEyj2ZPt83/zAv7p6cnJ3n+b7PPYfzburZtvu1QRC8ZkMQ/N+/
W/80Lz/lxjMveteBuw/n/0GrP9j4wu53HLy8xTa99t4/OHzg7G/mLujyXfP7
CysP5j5Tpx3Yt2V5fSV3u87ced7AS+c8mvvtevn2Ixe+4cuP5Q71/Xd87dav
LBzJfb72HDx04PiXVnP/vtIbj51a2P7D3O/SphNv6Nz+h0/l7tCPXz7/byZ7
s9zv0bfKhzZ94NvHcl8AXwgX4ffC74Mvgi+GL4HfD18Kd8Kb4M3wB+At8B/D
l8GXw7J2cHAFPoeDK/E5HPwJPoeDD+JzOLgKn8PBh/A5HPwpPoeDLnwOBx/G
53DwZ/gcDq5W01+f7mpdadbvNXrYX9/uGsVm/V+rn/r7w12rc+7w989HdJq/
v9xHFJj9d50u8fenu04Xmv1b0ntXvf2tkk6bvv2aTV+8f0vr50v6dmv/P/Cq
05JeuufV41sOtuptrT+/ZW3Vs3e9ev6W3VY1d7z698uP36qNrb9/fvw2HWtd
X378Nn2qdf358dv0r63fT378Nl3a+v3lx1+v51u/3/z46/Ufrd9/fjycwsFH
rQU7OIWDj+F42MEpHPw5jocdnMLBx3E87OAUDrpxPOzgFA5uwPGwg1M4+ASO
hx2cwsEncTzs4BQObsTxsINTONiO42G3XS/46zPdrg+a9btD3/HXt3bo82b9
79D/+vsj3aG3mf2zU7+z09tf2qkNB/z9t1Ob/f2Z7tSl9/r7N9KVq97+DiO1
+v9vrf4r0jf8/keRXrjHmx8u0tn+fEkiHb/Lmz9ppJ/s8OZTFuk0M7926Wl/
voW7dJM//7RLh/35GO3SJf78dLv03/58TXbp3/35m8IZHNxkHcKCI9jBCZzC
GRzcjPPDgiPYwQmcwhkcfArnhwVHsIMTOIUzONiN88OCI9jBCZzCGRzswflh
wRHs4ARO9+hn/vrM9uhDpv979Yi/vsO96jPrf69+5u+PaK/O9feP26sz/P4n
e3Wq3/90ry7z92e2VzL9L+ujfv/Dsk7tPfrAP735oVb/Vdbf+/2Pylrz++/K
+l1/viRlPen3P33l5/3+Z2U9f7s/v/bpSX++hft0pT//tE/3+/Mx2qez/fnp
9mnNn6/JPj1q5jWcwcGnrUNYcAQ7OIFTOIODz+D8sOAIdnACp3AGB5/F+WHB
EezgBE7hDA4+h/PDgiPYwQmcwhkc7Mf5YcER7OAETvfrRX99Zvt1gel/jxr+
+g57dINZ/z36ub8/oh69xu+/69HH/P4nPdro9z/t0Yi/P7MedZn+x9p91Nvf
hTi//3+41f8w1l/686EY62m//4p1rT9fSrGO+v2PYp3vz6c41pr//d/F+qE/
32qx5M+/JNayPx/rsc7y52ca6zl/vjZiPWLmPdyEg1usC3AIF2HBJTiCY9jB
NTiB63AKN+AMbsLB53H9cAgXYcElOIJj2ME1OIHrcAo34AxuwkEvrh8O4SIs
uARHvfq5vz7jXl1o7l979Zi/vmu9+qRZ/7064e+Peq9e5/c/7dUN/v5q9Op0
v/9Zryb8/dns1VbT/z71H/X2d6FPb/q7m48+ePyRVv/DPjn/+0GxT4/7/Vef
PuzPl1Kfjvj9j/p0rj+f4j79yO+/69NRf77V+nSZP/+SPt3nz8d6n87w52fa
p2f9+dro03fNvIebcHCrdQEO4SIsuARHcAw7uAYncB1O4QacwU04+AKuHw7h
Iiy4BEdwDDu4BidwHU7hBpzBTTjox/XDIVyEBZfgqF+/8Ndn3K+iuX/t1/f9
9V3r13az/vu17u+Per9e7/c/7dcOf381+vUWv/9Zv6b9/dns1ydM/yuqmv5X
8u///5n3v6L9pv8Vfdf0v6KrTP8rapj+V3SO6X9Fz5j+V/QD0/+Ktpj5V9G9
pv8VnW76X9GPTP8rJ3//+fyDm3DwResCHMJFWHAJjuAYdnANTuA6nMINOIOb
cPAXuH44hIuw4BIcwTHs4BqcwHU4hRtwBjfhYADXD4dwERZcgqOBk/s/v/4B
vc/0f0CPm/4PaKdZ/wP6pen/gE4x/R/QTab/A3qr6f+AFkz/B3Sz6f+gvmL6
P6jqc1946fknvpf3f1DbTf8H9S3T/0HJ9H9Q3zH9H9RZpv+DOmb6P3jy/V8+
/wa12cy/Qf2z6f+g3mz6P6j/Mv1/5fxm/sNNOPiSdQEO4SIsuARHcAw7uAYn
cB1O4QacwU04uA3XD4dwERZcgiM4hh1cgxO4DqdwA87gJhwM4frhEC7Cgktw
NKQTpv9Dutj0f0irpv9D2mXW/5B+bfo/pFNN/4e0x/R/SL9n+j+kvzL9H9Jn
Tf+dvu73v83lz/8eb/W/4HS13/92p8N+/0OnLf586XBa8ftfdDrdn0+dTk/7
/ZfTY/5863Lq9Odfyanuz8dup43+/IycnvHna/mVnze9gSuwg6twDV6EE3gJ
rsPLcAqvwA14Fc7gNbgJr8PBsHUbXIDb4RDugItwJyy4Cy7B3XAEl+EYrsAO
rsI1eBFO4CW4Pqwzgnf+//pcHtb7zf3rsJ7w1/fKsG73139jWA/6+2N1WG/0
+58N69P+/lobVuL3vzmsc/z9uT6sPtP/Ef2L3/+2Ed358vx5555+otX/wog2
+f1vH9E9fv/DEX0z8uZLx4iu8OdPcURv8udT54ie9PuvEX3Zn29dI7rFn3+l
ER3y52P3iN7oz89oRL/x52t5xL5/jeEK7OAqXIMX4QReguvwMpzCK3ADXoUz
eA1uwutwMGrdBhfgdjiEO+Ai3AkL7oJLcDccwWU4hiuwg6twDV6EE3gJro9q
3V+fy6OKzf3rqO701/fKqHb7678xqiD09sfqqK72+5+N6kX//draqN7t77/m
qP7W7//6qAa/4fd/TI/67/faxvLn/0/k/R9Tx+N+/8d00J8f4ZguMv0f0wOm
/2Oa9d//d46p3Z9fGtMjpv9jutj0f0y9pv9jusL0f0zHTf/HdMjMf7gCO7gK
1+BFOIGX4Dq8DKfwCtyAV+EMXoOb8DocjFu3wQW4HQ7hDrgId8KCu+AS3A1H
cBmO4Qrs4CpcgxfhBF6C6+M6y/R/XJtN/8f1lOn/uO40/R/XQ6b/4yqY/o+r
1/R/XAdN/8d1vun/uCZM/yd0zPR/QptvHToRHDyW7/8JvcX0f0J3mv5PqG76
P6FO0/8JbTD9n9BR0/8J1Uz/J/Q50/8JfdX0f0KnmP5P6Nem/xN6yMx/uAI7
uArX4EU4gZfgOrwMp/AK3IBX4Qxeg5vwOhxMWrfBBbgdDuEOuAh3woK74BLc
DUdwGY7hCuzgKlyDF+EEXoLrk/ql6f+k+kz/J3XA9H9S+0z/J7XB9H9S15n+
T+pXpv+T+iPT/0ndZfo/qTnT/6peNP2v5u//nsr3f1WvN/2vatH0v6r3mP5X
dZ/pf1Wjpv9VnWn6X9XDpv9VFU3/q+ox/a/qMtP/qjLT/6q+buY/XIEdXIVr
8CKcwEtwHV6GU3gFbsCrcAavwU14HQ6mrNvgAtwOh3AHXIQ7YcFdcAnuhiO4
DMdwBXZwFa7Bi3ACL8H1KZ1t+j9l1286peOm/1M6YPo/ZffH6pTdP9mUBk3/
p3S36f+U3Z/rU/pr0/9pbXjC7/+03jnzwnPHrlrPv/9P2/nQPq2a6f+0/sH0
f1pF0/9pO586p3XE9H9as6b/03b+labtfOye1utM/6ftfC1PY/7DFdjBVbgG
L8IJvATX4WU4hVfgBrwKZ/Aa3ITX4WAG/YcLcDscwh1wEe6EBXfBJbgbjuAy
HMMV2MFVuAYvwgm8BNdn7P3p8owqpv8z9v52Zcbe/zZm1Gb6P6PrTf9n7P31
2oy9/27O6B9N/2d0h+n/rL2/b5vN3/+fvP+f1fEjfv9n7feHcNZ+v+iY1SHT
/1kNmP7P2u8vmrXfb7pmdYHp/6w+Y/o/a78/RbN6yvR/Vl8z8x+uwA6uwjV4
EU7gJbgOL8MpvAI34FU4g9fgJrwOB3PWbXABbodDuAMuwp2w4C64BHfDEVyG
Y7gCO7gK1+BFOIGX4Pqc2k3/5+zzq3ROz5r+z+mrpv9z9vnY6px9fpbNacz0
f073m/7P2edz63P2+V0wr3eb/s/rlsN93/uf204+/5tXw/R/XreZ/s/rDtP/
efv8sThvn092vvLnmf7Pq2r6P2+ff5bm7fPR7nm9/Au///P2+Wp5Hs9/4Qrs
4CpcgxfhBF6C6/AynMIrcANehTN4DW7C63CwgOf/cAFuh0O4Ay7CnbDgLrgE
d8MRXIZjuAI7uArX4EU4gZfg+oJ9P7W8oEHT/wX7fmtlwb7/aixoo+n/gj5u
+r9g36+tLdj3b80F3Wf6v6C7Tf9r9v3ehlr+//88c/i3WqUObw==
           "]]}, 
         {RGBColor[1, 0, 0], PointSize[0.005555555555555556], 
          AbsoluteThickness[1.6], LineBox[CompressedData["
1:eJxdmn2MXNdZhy+RVS1thEaRVY3ASi+WFY1MCEMawtaY9NfEaTepCUNiOxPH
CTfrXbPxV2bXnvXO2ru+s/P9PVRVtaoiNApW2EQRGtL8sY1SelVMO6IhDMU1
S4iiSxWFVVXBUEVhCRZi0D1HvO/v/mM9e3zOvefjPc/5mF+dfuHx2dscx/mF
XY7zf/9Gz+iLjn6gcYI4RrybOE68h9gl3ku8j/gu4gTxfuK70V9Mfv7txjVT
r3tQ3fjx8e/++huGkxje+dHNF/7iO4Z/E/HDD32rOftXhu/Fi7/yHy913vyB
4c8j/PY3/3r3j39o+D6Mcru/8PXX/87wb+Gt+eD9oxt/b/h+jD5987PdY/9g
+Ldx45VrL/z7T24YnkT6O3uyVw/fNPwF/M/UxK8997V/NHwAONj9xg+/tWX4
d7C//hsHbu//k+GD2Nv9QaFSftfw7+LGv/7x3d++/58NP4CXlt6o3xdY/iK+
t/TwjWt73zMMLPziN57422cM+8DiPX/arM3b9C9R+pco/4N4WZbvP4h31fsf
wn75ff5DSKjvP4QHZP38Q7jtEVn/h3FCto//MN5V7fdlfCTb1/8yvqfa/ytw
lkX/+F/Brjdl/00hkP3rT+Gg6v9HEMjx4T8CX42fRzGS48t/FNHfg4PRv181
bB6f2DlM6cTO71E6sfMYpRM7v0/pxE5KM4h94oDY+QPKT+wTB8TO45Sf2CcO
iJ0nKD+x/4SN/+9G+Z+AF/VfxM4R9KL+jRhHkIz6P2L/CN6IxofJfwQ7Ufyb
/EfxURT/Jv9RG/8m/1Eb/yb/UdyMxq/Jf8zGv8l/zMa/yX8MB6P4MPmP4a4o
fkz+J5GI4svkf9LGn8n/pI1Pk/9JXI/i1+RP42IU3yZ/GktR/Jv8lB6kKf9T
2JDl4ym8p97/FO6W3xc8Zecvk/+4nd9M/uPY9Yis/3F4sn2C43hPtd/T2JHt
i6dxXbX/09i1LPoneBoTb8r+O4GB7F+cwCHV/yesH0z+E+iq8fMMYpfE+MIz
iP4+eCvKb9k8AbHzrGYQ+8QBsfOHlJ/YJw6IHU+zSwxij9gn7hEHxCGx8xy9
nxjEHrFP3CMOntP+D5+z8W/m72kb/xG70zb+I8a0jf+IvWkb/2a+n7bxH3Fv
Wvs/mNb+D6dt/Jv3n8Rx6Tf3JBzpP5y08W/ef1L70z+p/do7qf0bnLTxad5/
0savef8MFqXf3RksS/+D0r0ZfF/m92fwqiy/N4P31ftncI/8vnDMyv+zOCTr
585iQtV/FtOyfbxZhLL9/Fl8Itu3N4uBav9Z3C79H84ipvx/CkPZv+4pHFb9
fwqhHB/eKazL8eOfQvKSGF+9U4jKHUb+DyybJyR2/kizSwxij9gn7hEHxCGx
M0fvJwaxR+wT94gD4pDYeZ7eTwxij9gn7hEHzyPMivk5fB5pNX+fxqSc393T
uPVVMf/jNNLSD95pXJf+90/jRen/3mlck/4JTmMg/RSexl8qf53BY9Jv7hl8
KP2PM7hH+tE7g5j0p38Gd0i/9s7gLenf4Aza0s/hmXG8Sn+fxbPS7+5ZTEv/
g9K9s3hN5vfP4muy/N5ZBOr9Z/FZ+X3hmJX/z+F+WT/3HEaq/uf0+sg7h4Fs
P/8cbsj27Z3D66r9z2FT9k94Dh+o9dt5LMn+dc/Dlf7HefhyfHjnsSHHjz9O
l+vL3nlE5d6I/B9YNk9I7Lyg2SUGsUfsE/eIA+KQ2MlojhG7xEliEKeIPeIM
sU/cJe4R94kD4iFxmMEoK+bnUcbGv5n/5wE5v8fmbfwbH8zb+I84OY+B9D/m
bfxHnJq38W98MW/jP+LMvI1/4495pKTfuvPYlvv/3jyS0o/9eRv/xm/zNv4j
Ho7Ll/4N59GVfh7N2/g19V+AJ/0eW8CM9L9L6ckF/LnMjwV8XZafWsB1+X5v
Ab8svy+zgLhavyzggKxfdwE/V/Vf0Pv//gLelu0XLOCmbN/hAt6Q7R8uIJD9
M1rAz9T5zQVckf0bu4CE9L97AV05PpIX0JfjBxfQk+vL1AVE5W5F/vcsmydD
7BN3iXvEfeKAeEgcEo+InYuaY8QucZIYxClijzhD7BN3iXvEfeKAeEgcXrTx
H83Po4vk/6yN/4hjWThy/nez2v/JrI1/44csetIvqSxelv7xstr/mSwC5a+s
jf+Iu1n8VPqvl8W90o/9LO6Q/gyy2C39Osxq/4ZZ7edR1savqf8ipqXfY4s4
Jf3vUnpyEX2ZH4tYl+WnFvF9+X5vEXvk92XGrNYvi/p8o7uIj1X9F/GsbJ/+
It6R7Rcs4l3ZvsNFbMr2DxdxXfbPaBEj5f9LKMr+jV3C3ar/L+nzoeQlBHL8
YMzS/6lLiMp9L/K/Z9k8GWKfuEvcI+4TB8RD4pB4ROwsaY4Ru8RJYhCniD3i
DLFP3CXuEfeJA+Ihcbhk1/9m/l8i/+fs+t/M/znyfw5HlP9zdv1v5v8c+T9H
/s+R/3Pk/xz5P0f+z5H/czb+jf9yNv6N/3Lk/5yNf1P/HPl/2ca3qf+yjX9T
f0pPLtv4N/VftvFv6r9s49/Uf9nGv6n/so1/U/9lfb7RXbbxb+q/bM//TP2X
MVT+X7bxb+q/bOPf1H8ZA+X/ZXyk/H8ZVeX/y/r8x72MDeX/yxgo/1/GUPn/
MqJy3zf+t2yeDLFP3CXuEfeJA+IhcUg8InauaI4Ru8RJYhCniD3iDLFP3CXu
EfeJA+IhcXhF7/9HV8j/K3r/H1vR+393xca/mf9X9P4fK3r/n1rR+39vhfy/
ovf//gr5f4X8v0L+XyH/r5D/V8j/K3Z9buq/Qv5fJf+vYk75fxUzyv+reF35
fxXfVP5fxUD5fxWu8v8q7lT+X9Xn/91VfKLqv2rP/0z9V/Ej5f9VvK/8v6rv
X8JVDJX/V3FL+f8qusr/VzGp/H8Vm8r/V7Gl/H/V3v+Z+l9FVO6/GP9bNk+G
2CfuEveI+8QB8ZA4JB4RO77mCeIYcZzYJU4QJ4kniUE8RZwiThN7xHPEGR/J
nJifl8b8ijy/9RH7nJjfq2OW83/XR3yP8MO6j/vk+XHPx4Q8X97wtX/6PtzP
CD9t+vhY+cvHWem3gY8D8vx76GNO+nHLx6PSn6E/Dh/h120fu7aFf0c+3pZ+
3vHxofJ/HuvS7xN59KT/Y3n8iUyP5/Fzmd/NYyDLT+Rxm3x/Mo+0/L7JPE7L
70ce07J+U3ncK+ufyuNF2T7pPPa/KtrPyyMu23cuj49l+2fyaMr+Wcpjj+w/
P49dsn+reWyo/h9/vyvGx3oeO9L/vTyCJTG+NvKI2vU/I//3LZtnkzggHhAP
ibeIQ+Jt4hHxDrGzpnmCOEYcJ3aJE8RJ4kliEE8Rp4jTxB7xnGVz/5pZA+T8
vLSG4M/k+e0aEp8T83t1Dbvl/N9dQ0b6YX0NXemP3pq+X95Y0+fP/TV7PhXx
5hp+pvy1pve3gzXsSP8N17Bf+nFrDfdJf4Zr2Cf9ur2GofTvaE37eWeN7u8L
9vc9EU8U9P1/jNLjBZ3fLdj7v4gTBXwo358saP9PFpCU348CHpf1mypgn7z/
TxXs/WjE6QI+kO3nFXDHZ0T7zo2/R7Z/pqB/n7E0/h55/+8XcPse0b/VAnap
/i/AkeNjvYDEK2L89Mbl5cT42iiY8WeePvEmcUA8IB4SbxGHxNvEI+IdYqeo
eYI4RhwndokTxEniSWIQTxGniNPEHvEccaZI/i+S/4uIK/8Xyf9F7FH+L5L/
i/p+eaOIN5X/i9ir/F/EjvJ/EeeV/4s4qPxfxFnl/yIOK/8XAeX/IiaU/4t4
R/m/iJ8q/5fwovJ/CdeU/0t4Sfm/hI+V/0u6/EQJn1L+L+GE8n8JGeX/kl7f
TJUwqfw/fr/yfwlJ5f8S7lT+L+GW8v+4fsr/JSSU/0uIKf+XsKn6v4Ql5f8S
4nL89EoYKf+XELXrfxn/WzbPJnFAPCAeEm8Rh8TbxCPiHWKnrHmCOEYcJ3aJ
E8RJ4kliEE8Rp4jTxB7xnOW+8f+Ylf/L2FD+L9v1v5n/y5hQ838ZM8r/ZfjK
/2Xtl40yXlP+L2Oo/F/W/grK+n57ULb3X8b/Zdyl/F+2v58x/i/jTuX/Mv5G
+b+s9/875fF6Vfq/gvPK/xVcVP6n9HhF53cr+veFiQp+ovxf0d83WdHfjwoe
U/6vYK/yfwXHlP/H5Sv/VxBT/q+Q/yv299mm/yt2/W/6v4IJ5f+Kvv/pVsj/
FbjK/xXyf8WMP/P0iTeJA+IB8ZB4izgk3iYeEe8QO1XNE8Qx4jixS5wgThJP
EoN4ijhFnCb2iOeIM1Xyf5X8XyX/V8n/VbjK/1VMKv+P/7/yf1X//q9fxT7l
/yo+Uf6vIqP8X8UDyv9VnFf+ryKl/F/Fg8r/VXxa+b+KHyn/V/Fvyv819JT/
a9hQ/q/hZeX/Gj5R/q/p8hM1/f5kDdPK/zVcVP6v6fpN1XT9U+PvUf6v4X7l
/5pu37kabluQ/h/nV/6v6f7za7p/qzUMVP/X0FX+r+nx06vp8bVRQ9Su/238
b9k8m8QB8YB4SLxFHBJvE4+Id4iduuYJ4hhxnNglThAniSeJQTxFnCJOE3vE
c8SZur7/X6pjXfm/ruf3ap3m/zpOKP/XcUX5v679slHX/unX8Y7yf137K6hr
vw3q+vdvwzr2Kf/Xyf918n+d/F8n/9fJ/w3yf4P8T+nxBvm/oX//n2jgA+X/
Bvm/Qf5vIKX83yD/N/T6KN2g/X+D9v8Nvf7KNGj/38A+5f+GXf+b/m/Q+q+h
14frDRv/pv8bgPJ/A1G7mvVn37J5NokD4gHxkHiLOCTeJh4R7xA7Tc0TxDHi
OLFLnCBOEk8Sg3iKOEWcJvaI54gzTbs+M/N/k/zfJP83yf9N2v83af/fpP1/
k/b/TfJ/k/zfJP83yf9N8n+T/N/EIeX/8fco/zdxQ/m/Od6vSv+3yP8tvKr8
38KG8n8Lt5T/W7r8RAu/pPzfwozyfwtLyv8tLCj/t/Cg8n8Lryn/t3BA+b+F
hPJ/C59S/m+hr/zfApT/x/mV/1sYqv4f11/5v4Up5f8WPOX/FqJ2vWX8b9k8
m8QB8YB4SLxFHBJvE4+Id4idtuYJ4hhxnNglThAniSeJQTxFnCJOE3vEc8SZ
Nvm/Tf5vk//bdP7bhqf836b9f5v2/23yf5v2/23a/7f1+fagTfv/Nu3/2/r8
PGzr8/XtNt5W/m/r3+fttOn8v0Pn/x06/6f0eIfO/zt4Tfm/g23l/46+n5js
6PsLdHBM+b+DhPJ/R9+PpDv6/sTr2Ps/4/+Ovn/JdPT9zFIHSeX/jp3fTf93
6P6no++H1jtIKf934Cv/dxC1q7l/6ls2zyZxQDwgHhJvEYfE28Qj4h1ip6t5
1//z/wJhqCyD
           "]]}}, {}},
       AspectRatio->NCache[
         Rational[1, 5], 0.2],
       Axes->{True, True},
       AxesLabel->{None, None},
       AxesOrigin->{0, 0},
       DisplayFunction->Identity,
       Frame->{{False, False}, {False, False}},
       FrameLabel->{{None, None}, {None, None}},
       FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
       GridLines->{None, None},
       GridLinesStyle->Directive[
         GrayLevel[0.5, 0.4]],
       ImageSize->720,
       Method->{},
       PlotLabel->FormBox["\"Window Length = 81\"", TraditionalForm],
       PlotRange->{{0., 1025.}, {-1., 1.}},
       PlotRangeClipping->True,
       PlotRangePadding->{{
          Scaled[0.02], 
          Scaled[0.02]}, {
          Scaled[0.05], 
          Scaled[0.05]}},
       Ticks->{Automatic, Automatic}]},
     {
      GraphicsBox[{{}, {{}, {}, 
         {GrayLevel[0], PointSize[0.005555555555555556], Thickness[Tiny], 
          LineBox[CompressedData["
1:eJxd2nl8lNW5B3Da0oq21nhdCO31dnArWsWoqGERfoBgFNAoAgFZhoSEQFgm
+2R/Z99ncq33SluFERXBBSKiRot1rveqqQvEBUhQcACBiFuslmLr59q5vud8
7vM7/MPnvJMz73ve8zzP933PmZGla+8s/+GQIUN+MHTIkP/73/43OOm0hede
e+mmp3aqA+jbd+aX5b/aMsluDsMPd1y2c9Pw51U7D5OWJtfk9bys2ufijE0r
JnSf6lHtfJy7ZGTLNyN2q/a/4rv1e0b/5N53VNuB9371eP3vU3tU+0JUbNm6
6XBbn2pfjMzCQ6fnLXpftS/F2JM/KVz0m4OqPQqffHfh70K1WdW+HK9Ubh07
/rVDqn0FClyHvv3bWUdUezT2XnD6JV/N/Ei1C7Dh0/iYFW1HVftqvDG+o2J9
+phqX4Mntq288MNnjqv2tbhx+HlV1s4B1R6DyaGvbs4+/bFqX4eHHvz5ZRV/
OKHa1+PGNSOm+Wo+Ue0bsO1F68vthZ+qdiGqX5vwdfNnuj0WNyWu2V3V+Zlq
j8PR4MmhI0d+rtrjsf/KV+dO3qDbE7C34J5/tJ/xhWrfiG0L/7b7vlLdnojz
HxnWMedR3Z6ESy95+6FEn24D7aubjow8qdoWYB8fVJ9PNj6fbPSfgnz5/dYU
bKfzT8V+eX3WVPTT9d+Ej+T4rJswncY/DbXy/ljTsJ3u33RMkvfXmo5NdP9v
xjQ5P9bNmE7zV4Rn5PxaRXiP5v8WPCDjw7oFeyh+bsUYGV/Wrfgzxd8MDMr4
tGZgCsXvTLwu49uaCRfF/yx8JvPDmoURG2T+3IYzZH5Zt2EI5d/tuE7mp3U7
RlP+FuPqPpHfKMYZ0fUzxza9MMH++2K8Zuf/S9+3M8X45unv+9vtIXfgl/b3
223cgWOPfH9+u23dgcHF31+f6n8HzrSvX/W/E4fs8an+d2KZPX7V/078yb4/
qv+duMG+f6r/bJyw76/qPxv/Y99/1X82rrLnR/WfjV57/lT/u7DOnl/V/y70
2vOv+t+Fp+z4UP3vwhQ7flT/OTr/Vf852GjHn+o/BxPs+FT95+j8V/3nwmXH
t+o/F1Pt+Ff95+KwnR+q/1zss/NH9Z+HPju/VP95eMrOP9V/Hobb+an6z9P5
q/qX6PxW/UtgHx9U/Y3PMyVG//k6/1X/+Tr/Vf/5Ov9V//k6/1X/BTr/Vf8F
Ov9V/wWok/cns0Dnv+p/NyDvL+7W+a/6363zX/W/W+e/6r8Qz8r5xULsoflf
iPUyPjILtR+q/yJcJ+MLi/A6xd8ifCnjM7MIN1H8LsabMr6xGDUU/4vxhcyP
zGL8kvJnCX6+ROQXlmDoJpl/SzBO5mdmCW7YIfPXiSl9Ir8dTtj+/5ftP5x4
RvrvdOLLp0X9sJwYLutL2onDj4j6k3Hi08WiPmWdOIPq11J8KOubYylKZf3D
UuyU9dG5FNfJ+mktxceyvqaX4r9l/c0sxWhZn7NLsZvqdynuk/XdUYrdsv6j
FF3SB2cpJks/rFJA+pIuxYPSn0wpxkufsqXYSn6V6fxX5y/T+a/OX4ZD0kdn
mc5/df4ynf/q/GXokv5mynT+q/OX4RLyexn77lgG+7jyH8bnzmXsv7WM/U8v
Y/8zy9j/7DLj+aWcn28c5biZxl+u81+dvxxPy/tnlev8V+cvx6N0/8sxXc5P
Nvf95H8FnpPz66jAXpr/Cn4+dFbw86NVgetlfKUr8AbFXwX+IuMzW4Hp5P9y
7JLx7ViOOor/5fiLzA/nclwg88dajnOk/+nlOF36n1mOiTI/s8sB8r8Sd0n/
HZU4vbb/pW1nvWr7j0o8LP13VmJA+m9V4l9kfUlX4oD0P5P7e+l/thIn1sv6
tQIHZH1zrMAUWf+wAi/I+uhcgeGyflorMCDra3oFdsv6m1mBK2V9zq7Afqrf
K/Gfsr47VmKXrP9YiUekD86VgPTDWonrpS/plTr/1flX4lrpU3alzn91/io0
SN8cVZgi/UMVjkkfnVXsv1XF/qer8KT0N1Oln//V+atwMfm9in13rIJ9XPkP
43PnKl0/1PlXsf/pVfr9Q51/FfufXaXzX51/NU7I8TlW6/xX51+NFnl/nKt1
/qvzr8ZYeX/Tq7GZ7v9q3CjnJ7saReT/Gjwp59exBvto/tfo/FfnX4OPZPxY
a3CDjK/0GvRT/K3BVzI+s2twBfm/Fr0yvh1rMZ/ify2+lvnhXIsfSP+ttZgj
/U+vxZnS/8xaeGV+ZteiiPx3obxf5HeeSz3/v27773DhHlkfClz4UPoPF2bJ
+lLsQr/03+nChbI+uVwYkO//lgvvy/rW6QJk/Uu70C3rY5cL58n6mXHhuKyv
vS7skvU369L5b7cHc9dH/lfr/LfbedV4S9Z/RzUelj4UVOv8V+OvxnXSl+Jq
pKU/zmpcI31yVeNJ8qta578af7XOfzX+ap3/avzV2Cv9zFRjn/S1t1rnvxp/
Nb//D1br/Ffjr2Hf82pgH1f+O4zPC2r4+QE17H9xDT9/OGvwvrw+Vw37b9Xg
Ezm+zhr2P12DVnl/umqwQ96/TI3OfzX+Gp3/avw1mCjnZ7AGt5D/tTr/1fhr
0UfzX4u0jI+CWp3/avy1KJTxVVyL/TL+nLX4Wsanqxaj6fm1Fu/I+O6sxd0U
/7U4KfOjqxY/kv5najFf5ldvLc6W/mdrEZT5OViLO8j/OjT2i/zOq8PPHizr
f/nwLtt/Rx0s+X5QUIe90n/U4RZZX4rrsEf676zDBbI+uepwVPpv1aFf1rfO
OkyU9S9dh2dlfeyqwzmyfmbqcEzW1946vCXrb7YOV8j6PFiHPvK/Hv8h63te
vc5/VY/r8ZD0oaAek6QfqNf5r8Zfr/Nfjb8eV0ufXPU6/9X461EvfeusZ//T
9ex/V73OfzX+ep3/avz17H+2nv0frDf8b2Df8xpgH1f+O4zPCxrYfzRghPz+
4gad/2r8DTr/1fhzbXp+adD5r8bfgCIaf4POfzX+Bp3/avwNGCfvb28Dtsj7
n23Q+a/G36DzX42/EVvl/OY16vxX42/EgzI+ChpxVMYPGjFWxldxI96X8eds
xF9lfLoaUUDPr414T8Z3ZyMWUfw34pTMj65G/Fj6n2nEYplfvY04X/qfbURU
5udgIxaQ/26EyX+3ev9/W/nvxhry3423yH83ppH/bvSS/26MIP/dOEL+u7GP
/HdjAtU/N3aQ/26cTf67cZT8d+v8V/XPjd+Q/26d/6r+NeFe8r8Jb1L9b8JG
8r8JE8n/Jowh/5uwgfxv0vmvxt+EJ8j/Jp3/avxNmEz+NfH7cVeT4X+T4X/u
+8n/JsP/JlxE/jcb/jfDPq79Nz4vaDb8b9b5r8bfbPjfbPjfrPNfjb/Z8L9Z
578afzPayP9mPEP+N+v8V+Nv1vmvxt+MSeR/M24l/1uwjfxvQT/Nfws2kv8t
OEb+t2Ac+d+CD8j/Fp3/avwtuIb8b8Fe8r8FSyj+W/B38r8Fp5H/LSgl/1vw
C/K/BSnyvwVl5H8rfk/+tyJ8vOGbE/vfVf63YhH534pXyP9WgPxvxZvkfyvO
I/9bcYj8b9X7f6r+tWIc1b9WbCf/W3EW+d+Kj8j/3PnJ/1ZcTv63Yh/534bf
kv9tev9P1f82PEj+t+n9PzX+NlxL/rdhPfnfhgLyvw2Pk/9tvL7d2abzX42/
Tee/Gn8b9pD/bXr/T42/Tee/Gn+b4X+bzn81/na0kf/tsI9r/9sN/9sN/9sN
/9sN/9vxAfnfbvjfjk/J/3bcQuNv1/mvxt+u81+Nv12vr6rxt+Mx8r9dr8+q
8bdjBvnfodd31fg7sJ/mvwMPkf8dOE7+d2A8+d+BA+R/B06S/x0YQ/53oI/8
78BSiv8OfEv+d+B08r8DFeR/B/6N/O/Ab8n/Dqwi/y08If0fZqn1v722/3kW
Zkj/8y3slP47LEyQ9WWUhR7pf4GFs2V9KrTwofQfFt6R9a3IQqGsf8VWLp5E
fSyxcKasn04LR2R9rcz9vay/LgtTZX12W8b6rYV7ZH0PW9gh63+npfeH7PY6
i/f/0xaukb5sthCX/nRZvD7dben8V/XbQoX0rcfCLOlfr8X7432Wzn9V3y3s
kr4OWLz+Pmix/6csw38PWqXvwzywjyv/8zzokJ/ne3CZ7O/w4Fz5/aM8ev9R
zb9H57+afw+OyuuHh/c3ijw6/9X8e9Au70+JB6/I++f06P1VNf8ePC7vv8uD
2XJ+3B7cQPs3Hr2/q+bfo/Nfzb8Hf5Txsc7D+0fp3PllfG324KCMvy4Pzhly
0f/HZ7cH19Pza+58Mr57PFgv47/Xg5dlfvR58FPpf9aDlTK/BjxIS/8HPRgh
8/OUB3XkvxcvSv+HebHxu+TIC84+afuf58VY6X++F09L/x1ePO8U9WWUF5Nl
/Snw4meyPhV6cUD6Dy/ulfWtyItqWf+Kvdgq62OJFz+V9dPpxf/K+lrp5f1X
lxejZH12e7GT1m+92CLre9iLP8v63+lFWvqwLvd90o+0l/eXN3vxgPSny4ur
pE/dXrxAfnn171vsdo8XkP71etEvfezz4qD0M+tl/we87P+gF2dLn095jf17
H/s/zAf7uPI/z/g838f9HT72f5QPz8nzF/jwnry+Qh8+kNcPHz6T4yvyYa4c
f7FP/z5Kzb8Pz8r75/Rhlry/lT78Tt5/l49/n+H2YSbt3/jwmpzfsA+v0Pz7
8LCMj3U+fCzjJ527Xhlfm338+5MuH07J+Oz2wUXPrz5slPHd40O5jP/e3Hw4
RH70+TBD+p/14Su5vzbgw69l/g36cL/0/5QPrc9I//3YLff3hvnV+v9+5b8f
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

           "]]}, 
         {GrayLevel[0], PointSize[0.005555555555555556], Thickness[0.01], 
          Opacity[0.5], LineBox[CompressedData["
1:eJxd2n+MHGUdx/EHLXJU0EUrXEVkQQMnMbiIyIGVfkDRQ35N+SELQjuApQsi
HbyDLt5Jn16v1+31ejdREjfEwEikXuOvIfzIQmoYScQNURnFwhaDTCHKhRiz
hIQc8Q/E7pI8z/v+ubw699zc/PF83zszPeGGjZetf58x5pBlxvz/e++ru/qw
a1ecftLuh/b2/0GdF458Y/3xe1b3OKD3PfKZvbuPebzvklZfP3dbqf1U3yu0
fPfNq1pL7b4HtWLdCeNvr3y270/onfv2nfqBe/7ad1l/O/4Xd9w7v6/vE+FP
wyfBQ/Ap8GfhU+EKfBr8efh0+AvwGfAX4TPhYfgs+Gz4S/Aq+MvwOfBqWL4t
bM7Fcdich+Ow+QqOw+arOA6b83EcNl/Dcdh8HcdhM4LjsLkAx2HzDRyHzYU4
DpuLcBw2F+P4xVp5v7t/LtFyd3/ZS2S8/XepznD3p71Up3r7N9BpHWd/K9Dy
mfsuOuuuJ1b1fj7QH3r7/8mDzgK9/fDB9T2bNTq29/t71hr968GD5+/ZrlF3
7cG/r79+jY7s/f399ZfpQO/6+uthC2ewuRzrYQtnsLkC62ELZ7C5EuthC2ew
+SbWwxbOYHMV1sMWzmBTxXrYwhlsrsZ62MIZbK7BetjCGWy+hfWwhTPYXIv1
sIUz2FyH9bCFM9isxXrYwtlaHevtn3X60Dpnf2mdlu129986ne3uz2ydznzE
3b+hzus4+7scqtf/3/X6r1CPuv0PQ73xsDM/bKhj3PmShHrlQWf+ZKH+vdaZ
T0Wo5d78ul4vu/OtDAsOYQsncAYXsLkB54cFh7CFEziDC9jciPPDgkPYwgmc
wQVsvo3zw4JD2MIJnMEFbNbj/LDgELZwAmdwAZubcH5YcAhbOIEzuIDNBpwf
Fhxu0HHu/rEb9FG3/8kGHe72P9ugc9z9WWyQvP7XdIXb/3JNh4/uf/I3H366
13/V9DO3/2FNi27/bU0fcedLUtNLbv+zd3/e7X9R0+v3ufPrZr3kzrcyLDiE
LZzAGVzA5hacHxYcwhZO4AwuYPMdnB8WHMIWTuAMLmBzK84PCw5hCydwBhew
+S7ODwsOYQsncAYXsLkN54cFh7CFEziDC9hsxPlhweFGHeL2327UlW7/k406
0u1/tlGT7v4sNmrE63+k9fud/V2K+p//n+n1vxzph+58qER62e2/Il3szpcg
0n63/2GkE935FEVadO//baS/u/MthhM4hTM4hwu4C5vbfZfgMlyBBQdwCEew
hWM4gVM4g3O4gLuw+R6uHy7DFVhwAIdwBFs4hhM4hTM4hwu4C5tRXD9chiuw
4AAO4Qi2cAwncDqq97v9z0Z1tbu/8lEd5fa/GNW0uz+7o1rj9X9Mm/Y7+7s0
piN+euP+p175c6//5TFZ9/6gMqbn3f5rTBe48yUY0z63/+GYjnPnUzSmf7r9
t2Pa7863GE7gFM7gHC7gLmzu8F2Cy3AFFhzAIRzBFo7hBE7hDM7hAu7C5k5c
P1yGK7DgAA7hCLZwDCdwCmdwDhdwFzabcP1wGa7AggM4hCPYwjGcwOkmHer2
P9ukte7+yjfpaLf/xSbNuPuzu0nXeP2vq+H1v96///9Lv/913eb1v64/ef2v
63yv/3XlXv/rWun1v65Xvf7X9YI3/+AETuEMzuEC7sLmLt8luAxXYMEBHMIR
bOEYTuAUzuAcLuAubL6P64fLcAUWHMAhHMEWjuEETuEMzuEC7sJmHNcPl+EK
LDiAQziCLRzDCZyO6zCv/+O6wev/uD7u9X9c817/x3Wj1/8J3ev1f0KN1+58
+/UXn+v3f0LXef2f0O+9/k9IXv8n9Eev/xP6mNf/CR3w+j/x3vuN/vyDEziF
MziHC7gLmx/4LsFluAILDuAQjmALx3ACp3AG53ABd2FzN64fLsMVWHAAh3AE
WziGEziFMziHC7gLm824frgMV2DBARzCEWzhGE7gdLMO9/q/WTd5/d+sT3r9
36wfef3frFu9/lv90u3/gO0//3u+1/+S1YVu/wet9rr9L1utcufLkFXb7X/F
6ih3Pg1bvez2X1ZPufNtBA7gKhzCNTiC67CFG3AMN+EEXoBTuAVncBvO4Q5c
wItwF16CzRbfA3AJHoTL8BBcgYdhwSNwAFfhEK7BEVyHLdyAY7gJJ/ACnMIt
OIPbcA53tuiDbv+LLbrF3V+LW5S4/e9u0Up3fy5t0ZjX/0n91u3/wKQeeGfu
hOOOeqvX/9KkznL7Pziph93+lyf1eOjMl6FJnevOn8qkjnDn0/CkXnL7r0nd
4863ETiAq3AI1+AIrsMWbsAx3IQTeAFO4RacwW04hztwAS/CXXgJNlt9D8Al
eBAuw0NwBR6GBY/AAVyFQ7gGR3AdtnADjuEmnMALcAq34Axuwznc2aoL3f4X
W/Wm+35tcatOdvdfd6t+4vZ/aasmHnX7P6Vn3fd7A1P95/8v9vs/paHn3f5P
aY87P8pTOt3r/5Se9Po/pVn3/f/wlAbd+aUpPe3NfziAq3AI1+AIrsMWbsAx
3IQTeAFO4RacwW04hztwAS/CXXgJNtt8D8AleBAuw0NwBR6GBY/AAVyFQ7gG
R3AdtnADjuEmnMALcAq34Axuwznc2aaS1/9tGvX6v017vP5v04le/7dp2uv/
tA54/Z/W2XdsfsvsOdDf/9M62uv/tB7w+j+t1Ov/tIa9/k9rmdf/ae33+j+t
2Jv/cABX4RCuwRFchy3cgGO4CSfwApzCLTiD23AOd+ACXoS78BJstvsegEvw
IFyGh+AKPAwLHoEDuAqHcA2O4Dps4QYcw004gRfgFG7BGdyGc7izXZd6/d+u
/3r9367Pef3frge9/m/XLq//Db3p9b/Rf//3j/7+b+hQr/8NNb3+N3SK1/+G
HvP639BWr/8NrfD639Az3vyHA7gKh3ANjuA6bOEGHMNNOIEX4BRuwRnchnO4
AxfwItyFl2Czw/cAXIIH4TI8BFfgYVjwCBzAVTiEa3AE12ELN+AYbsIJvACn
cAvO4Dacw50d/v4pdmjC6/8OPeT1f4e/P5d26Mde/2e07EW3/zP61M43Xjtw
/lL//n/Gnw+DM4q9/s/o517/Z1Tx+j/jz6fhGe3z+j+jWW/+wwFchUO4Bkdw
HbZwA47hJpzAC3AKt+AMbsM53IELeBHuwkuw2el7AC7Bg3AZHoIr8DAseAQO
4CocwjU4guuwhRtwDDfhBF6AU7gFZ3AbzuHOTl3u9X+n//l6caf/+bu7U7/y
+r9T93v9n/U/3w/M9t//v/f5f1av7HP7P+vfP5Rn/fuLoVn92uv/rMa9/s/6
9y+axf0fHMBVOIRrcATXYQs34Bhuwgm8AKdwC87gNpzDHbiAF+EuvASbXbj/
h0vwIFyGh+AKPAwLHoEDuAqHcA2O4Dps4QYcw004gRfgFG7BGdyGc7izy39+
VuzSlNf/XXrC6/8u//nc0i7/+Z2Z08le/+d0+96x5/5z93vP/+aUe/2f091e
/+d0v9f/Of/5Y2XOfz45/O7v8/o/p4Y3/+EArsIhXIMjuA5buAHHcBNO4AU4
hVtwBrfhHO7ABbwId+El2Mz7HoBL8CBchofgCjwMCx6BA7gKh3ANjuA6bOEG
HMNNOIEX4BRuwRnchnO4M6+rvP7P++/XFuf992/deT3m9X9eD3n9j/33e8vi
/v//eXXv/wCgq01W
           "]]}, 
         {RGBColor[1, 0, 0], PointSize[0.005555555555555556], 
          AbsoluteThickness[1.6], LineBox[CompressedData["
1:eJxdm3twXNV9xxfiPzSeNmxd0miATjehYTSU0g0UUIDCF3BAARcLP+UHsJYs
WbZseSVZb0u6+37vCmKo88CzgRYcY4hCUttkHLh4gLrGTTYTEovilA2vUcJr
cVxHxZB0yz1n+vv+7j+ez9w999xzzu/3+9x7rvyF9u3LOs/1+XznLPD5/u9f
76jd6OMDjA2K/YrPV9yo+CLFAcVfxPSSi9I39T9m7uOvMfO72dZfXnXQ8CU4
tv9gPHHNc4absMC9avQ3T75o+FJs7eg4e/CTlwxfhrz7+fjK6YrhyzF74aaX
71j4c8NBbHm693fX9PzC8JdxZPXy1Q9//4ThKxC/8dKfXnzyFcNX4tHPToW6
fvOq4b/Hk+9fd8Els78yfBX6L+4/+eXHXjN8NZb/1y0LD+yrGr4GL/zt4wfe
Cv/acDNS12x6+okvvW74K1j7yfpde45avhZnzwSOLV/zhuHrUHuoduGOE5av
x7vlw+73b37T8D/gheNfeODYNy3fgMs+d+Xi9GuWb8T1D5ztdv1vGQZ2/eqR
vSsuN+wAfxG+9IUrmu35m9T5m1T7m3G5vL5zM45S/7egJu/PuQUf0P0vxkdy
fM5irKfxfxUZOT/OV3GU5u9WrJTz69yKEZr/23BAro9zGw7R+rXgQbm+Tgte
pvX/GrpkfDhfwy8pfm7HLhlfzu3YSfF3BxplfDp34CTF7xLMyvh2lqBK8f+P
8P595XrvvGV73MnsKPYtVecV+1qZodhR7Cr23aXaK3YUu4p9y1T7ZWj0xv+s
134Zdnjz47G7DPu9+fPYtxxvP/vp/HqM5bjTm3/TfjkmvPUx7ZfjWW/9TPsV
WOqtr2m/As9662/ar0DEiw/TfgUe8eLHtF+J73jxZdqvRIcXf6b9Sizx4tO0
X4lnvPg17VfB8eLbtF+FZV78m/arcMrLD9N+Fd728se0X405L79M+9Vwvfwz
7VfjEi8/TfvVuNrLX9O+DUUvv037Nvi9/Dft1Xm3TbVfgyZ5fazBEep/DX4r
789dgzm6/7U4LceHtVhF41+LuJwfdy2O0PytQ6ucX6xDD83/OnxXro+7Do/T
+q1HTq4v1uPfaf3XY52MD3c9XqL4uRsZGV+4G10Uf3fjXFfEp3s3XqT4vQf7
ZXzjHqQp/u+B97vjh732lu1xLzMUO4pdxb4Qc0AxFIcUO4rLil3FVcW+Dar/
DTb/vfqHDTb/PQ5tsPlv6uUGm/8elzfY/PfY3WDz3+PqBpv/pr622/z3ONBu
89/0327z3/TfbvPf9N9u89/0327z3/TfbvPf9N9u89/032Hz3/TfgRXSf+iw
+W/677D5Y/rvsPlv+u+w+W/677D5afrvsPlr+t9o89v0v9Hmv+lfnQ9t5PbO
Rr5+eaPNf9P/Rpv/pv86k/87cUaOL9CJNhp/p81/038nnpfz53Ta/Df9d2I7
zX8nnpDrU+3E98j/XSjJ9Q104T9o/btwr4yPUP28jB+nCwUZX+Uu9FL8dWGh
9H+1Cz8h/2/CYRnfgU3YS/G/Cd7vfu75P2TZHI7ismJXcVWxr5s5oBiKQ4od
xWXFruKqYt9m1f9mNN0h6h82s/9DdZb109nM/i9vRlTWX3cz+7+6GSeofm9h
/we2sP+xBdukH0Jb2P/OFpSkX8pb0Cn9427BYumn6ha45K8epKXfAj02/03/
PZiXfgz1sD+dHvZruQfPSP+6Peznao/y91ZMS78HtmKR9D/U+dBWbu9sxaXy
+uWt/PzhbrXvJ6b/OpP/t+FjOb7ANpv/pv9tyMv5CW2z+W/634bb5fyWt2GA
5n8bHpLrU92GH5D/ezEh1zfQi5/R+vdig4yPUC/ekfHj9OI+GV/lXuyj+OvF
Iun/ai/2kP+347iM78B2VCn+t8P73QnP/yHL5nAUlxW7iquKfWFmv+KA4qBi
KG5VHFIcVuwong7b/Df1NMz+nwnb/Df1Ncz+r4Rt/pt6G8aUrM+1sM1/U3/7
cJes7/4+9n+gz+a/x8E+/Iv0B/ps/nvc2mfz3/iiz+a/x+E+m//GH302/z2e
7mP/l/ts/pvx97H/3T72a6WP/V/tYz/X+pT/+21+m/H32/w341fng/1olu3R
b/PfjL+f/R/qx/vy/sL9Nv/N+PvxBzm+6X7e/yj3oyjnZ6YfL8r5c/v5+arS
j0E5/9V+fj6r9eMg+X8AU3J9/QP4Ba3/ADplfAQH8J6MHwzgARlfrQN4SsZf
aAAXSP+HB/AoPb8O4KSM7+kB+KT/y3X+9HjV8/+MZXO4iiuKq4prin07mP2K
A4qDiqG4VXFIcVixo3h6B/u/vIP9P7OD/e/uYP9XdrD/qzts/ntc26H8P2jz
32P/IJ6T9T8wyP4PDtr8N/V5EPdJv7QOYpP0T2iQ/R8eZP87g+z/6UF+/y0P
2v0xM/5B+/xsxj/I/q8Msn+rg+zn2qDNXzP+Idwv/e4fwvnS/wF1PjjE7TFk
9xfN+IfwvOw/NGTz34y/zvT8MmTz34x/yO7/mfEPYVrOz8yQ3f8z4x/CnXJ+
K0MYlfNfHcIjcn1qQ3ia/D+MmFxf/zBO0PoPY7OMj+AwPpTxg2F8Q8ZX6zB+
JOMvNIwvSv+Hh/EkPb8O410Z39PDCMj3//IwvPt8zfP/jGVzuIoriquKa4p9
I8x+xQHFQcVQ3Ko4pDis2FE8PaL8P6L8P6L8P6L8P4Ik+X9E+X8Er5D/R5X/
R23+m/o/qvw/qvw/avPf1P9Rm/+m/o/iVvL/qPL/KLLk/1Gb/2b8o7w/PjPK
78/uKO//V0aV/0fZz7VR9rdvzOa3Gf+YzX8zfnU+OIZryf9jvP/fOmbz34x/
jPf/w2P8/cIZg+/30v9jvP9frvdP/h/DMfL/mM1/M/4xjJP/x/AY+X8MPyb/
jyNF/h/Hq7T+49hG/h/Hf5P/x/EQ+X8cR8j/47iE/D+OA+T/cXxM/h8HyP/j
8H73a+N/w/ZwFVcUVxXXFPt2MvsVBxQHFUNxq+KQ4rBiR/H0TgTJ/zsxQv7f
iSHy/07Mkf93Ik3+3wmH/L8T/0n+n8Ay8v+E/f5n6v8Eesn/E/b7n6n/E7if
/D+BbvL/hM1/U/8n8Bz5f8Lmv6n/E1hN/puw3//M+CfwDvl/gt+vKxO8/16d
YD/XJvAV8v8kvk7+n7Tf/8z4J+33PzP+SVxH/p/E35H/J/Ei+X8Sp8j/k/iQ
/D+Jc38v/T+Je2n89fsj/0/iJfL/JO4i/0/CIf9PYj/5fxJHyP9TyJP/p1Cl
9Z9CP/l/Ch+R/6fwMPl/CsfJ/1MIkv+n4JL/p+A/Lf0/hW7y/xS8+3zT+N+y
OVzFFcVVxTXFPoe5QbFfcaPigOImxUHFzYphueLVtxYHM9L/rQ4OyfrY5uBB
WT9DDhpkfe12cL2sv2EHz8v6POLgt7R/66Bd1ve0g0dl/Z92sE/6YbfD34/L
Dh6WftnrYJX0z4yDe6WfDjnKXw4S0m9HHWyV/qs4+Iz046yD09KfVQfvSb/O
OfiZ9G/NwVXSz/MObib/R/At6feGCP5K+t8fwR55vjGCFtk+EMGV8vpNEVRk
/8EIzsr7a45gwR5x/4iw/1si6Jbjb43gITk/bRG8KecvFME6Ob/dEeyS8x+u
/16uz0gE++n7TQRlub7pCE7R+kfwQxkfuyM4KeOnHMEBGV97Izgt428mgqMy
Pg9FMEfPrxGETov4PhpB9U4R/5X6/MhjVnFV8ZzimuJ5xb4oc4Niv+JGxQHF
TYqDipsVQ3FLFHN3ivrXGkW3rI9tUbwv62coioqsr931620U9TccxWFZn0ei
eJP2b6N4Rtb3dBR/kPV/Oor90g+769eT/ihHcUb6ZW8Uj0r/zETRKf10KIoa
+SuK70q/HY1iSPqvEsV50o+zUZy/R/izGsWffEf4dS6K16V/a1HcJv08H8V6
8n8MP5B+b4jhaul/vzrfGOP2gRiWyus3xfCe7D8Yw0J5f80xLJL3jxguluNr
iSEvx98aw2NyftpieFfOXyiGmJzf7hj2yPkPx/C+XJ+RGBacJ7/fxPCRXN90
DGdo/WM2/836x3DDRSJ+yjE0Pifia28Mc9L/MzEckvF5qM5PyOfXGJplfB+N
IS3jvxKDt05nPf/PWjZHVfGc4priecW+OHODYr/iRsUBxU2Kg4qbFcOya/wf
R5j8H8cPT0n/x3GG/B/Hx/L9vzuOy8j/cZv/pv7H8Tr5P4715P849lD9j+Of
yf9xzJD/4/g2+T+OVvJ//frk/zj+jfwfR5T8H8dm8n8c55D/4/b52fg/jnfI
/3H8lPwfxxXk/zhA/k/gG+T/BP6S/J/At8n/CdxK/k/w9ZsS+An5P4H/If8n
8BnyfwJ/lPsbLQlsIv/X+yf/J/AG+T+BteT/BO4n/yeU/xPYR/5PYA/5P6H8
n1D+Tyj/18+T/xPK/wnl/4Tyf0L5P6H8n4BPHrOKq4rnFNcUzyv2JZkbFPsV
NyoOKG5SHFTcrBiKW5LK/0nl/6Tyf1L5P6n8n1T+T+Jt8n8SLvm/3r5N1v8k
niT/J5X/k8r/Sewl/yfRRf5PKv8nsY/8n8Qw+T+JPyP/J/E58n8Sf0r+T+IN
8n8SLeT/JO4h/6fwr+T/FJrJ/+p8Y4rbB1K4i/yfwgfk/xTfX3OK7x8pfIn8
n0KJ/J/i56O2+vXJ/ykkyf8pfv4Kp3Ca/J/CQvJ/Cj5I/6fwMfk/hcPk/xQW
k/9TCJD/U5gn/6ds/pv1rzP5P4U28n/9PPm/fn+fHp8Y/1s2R1XxnOKa4nnF
vjRzg2K/4kbFAcVNioOKmxVDcUva7v+Z+p/GLvJ/mutnKI13yf9pXET+T3N9
Hknb/T9T/9NYQf5P40Gq/2n2w+40+6Nc/z35P43byf9prCH/p/nv19w0psj/
aXSR/9P8fXw2zX8/X03z3//NpXGc/F+fT/J/GjeQ/zP4J/J/BheS/zP4Jvk/
g8Xk/wxfvynD/QczmCf/Z3AO+T/D42vJ8PhbM/gW+T+D18n/GZ7f7gymyf/1
35P/M8r/GeX/jPJ/Bk+R/zMcP+WM8n9G+T+j/J9R/s8o/2eU/zPwyWNWcVXx
nOKa4nnFvixzg2K/4kbFAcVNioOKmxVDcUtW+T+r/J9V/s8q/2eV/7N4hvyf
Vf7PKv9nlf+zyv/165H/s5gn/2exj/yfxSbyfxYfkv+zeJz8n8UI+T+LReT/
LD5P/s/iPPJ/Fm+R/7O4nfyfRYj8n8NB8n8O15L/1fnGHLcP5LCC/J/DKfJ/
ju+vOcf3jxyayP853Ef+z2E/+b9+ffJ/Dhnyf/335P8cPiL/57CI/J9DA/k/
hwW0/jk8T/7PYQn5v37/5P/69WT8zeQwS/6vM/k/hxHyf739Uun/HLx1+qPx
v2VzVBXPKa4pnlfsyzM3KPYrblQcUNykOKi4WTEUt+SV//PK/3nl/7zyfx4B
8n9e+T/P729OHqvI/3nspvqfV/7PK//nlf/zyv95fj89lOf//+fm+e//j+b5
/beS5/fj2Tx/P6/m+e//5vL8/l3Lq/f/vHr/L2A3+b+g3v8L6v2/oN7/C+r9
v8D7D8ECPiL/F9T+f4H3N1oKvP/RWsAe8n8Bb5H/C7y/0l3Ag+T/AubI/wXe
v3EKvL+TLmCe1r+AH5H/C7x/VC7w/tLegvWPWf8CXib/F3j/yi3AIf8XEFgq
/V+/nvdDb39s1rI5qornFNcUzyv2FZkbFPsVNyoOKG5SHFTcrBiKW4rK/0Xl
/6Lyf1H5v6j8X1T+Lyr/F5X/iziX6n8RM+T/+u/J/0X2y96i8n/9/sn/RfaX
W8QT5P8iRsn/Rfw5+b+IRvJ/EX7yf3185P8ilpD/i2gn/5fwNPm/hOvJ/+p8
Y4nbB0pYRf4v4TT5v4RF5P8SLiD/l/A35P8SdpH/S/ge+b+EM+T/EvLk/xKe
Iv+XcO4H0v8lNJL/S/gs+b+EhbT+JRwj/5ewgvxfQpD8X78++b+EOfJ/ncn/
Jewm/5fQQv4vwevH92Nv/Q3bo6p4TnFN8bxi3zTzgv/n/wWeeV/m
           "]]}}, {}},
       AspectRatio->NCache[
         Rational[1, 5], 0.2],
       Axes->{True, True},
       AxesLabel->{None, None},
       AxesOrigin->{0, 0},
       DisplayFunction->Identity,
       Frame->{{False, False}, {False, False}},
       FrameLabel->{{None, None}, {None, None}},
       FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
       GridLines->{None, None},
       GridLinesStyle->Directive[
         GrayLevel[0.5, 0.4]],
       ImageSize->720,
       Method->{},
       PlotLabel->FormBox["\"Window Length = 101\"", TraditionalForm],
       PlotRange->{{0., 1025.}, {-1., 1.}},
       PlotRangeClipping->True,
       PlotRangePadding->{{
          Scaled[0.02], 
          Scaled[0.02]}, {
          Scaled[0.05], 
          Scaled[0.05]}},
       Ticks->{Automatic, Automatic}]},
     {
      GraphicsBox[{{}, {{}, {}, 
         {GrayLevel[0], PointSize[0.005555555555555556], Thickness[Tiny], 
          LineBox[CompressedData["
1:eJxd2nl8lNW5B3Da0oq21nhdCO31dnArWsWoqGERfoBgFNAoAgFZhoSEQFgm
+2R/Z99ncq33SluFERXBBSKiRot1rveqqQvEBUhQcACBiFuslmLr59q5vud8
7vM7/MPnvJMz73ve8zzP933PmZGla+8s/+GQIUN+MHTIkP/73/43OOm0hede
e+mmp3aqA+jbd+aX5b/aMsluDsMPd1y2c9Pw51U7D5OWJtfk9bys2ufijE0r
JnSf6lHtfJy7ZGTLNyN2q/a/4rv1e0b/5N53VNuB9371eP3vU3tU+0JUbNm6
6XBbn2pfjMzCQ6fnLXpftS/F2JM/KVz0m4OqPQqffHfh70K1WdW+HK9Ubh07
/rVDqn0FClyHvv3bWUdUezT2XnD6JV/N/Ei1C7Dh0/iYFW1HVftqvDG+o2J9
+phqX4Mntq288MNnjqv2tbhx+HlV1s4B1R6DyaGvbs4+/bFqX4eHHvz5ZRV/
OKHa1+PGNSOm+Wo+Ue0bsO1F68vthZ+qdiGqX5vwdfNnuj0WNyWu2V3V+Zlq
j8PR4MmhI0d+rtrjsf/KV+dO3qDbE7C34J5/tJ/xhWrfiG0L/7b7vlLdnojz
HxnWMedR3Z6ESy95+6FEn24D7aubjow8qdoWYB8fVJ9PNj6fbPSfgnz5/dYU
bKfzT8V+eX3WVPTT9d+Ej+T4rJswncY/DbXy/ljTsJ3u33RMkvfXmo5NdP9v
xjQ5P9bNmE7zV4Rn5PxaRXiP5v8WPCDjw7oFeyh+bsUYGV/Wrfgzxd8MDMr4
tGZgCsXvTLwu49uaCRfF/yx8JvPDmoURG2T+3IYzZH5Zt2EI5d/tuE7mp3U7
RlP+FuPqPpHfKMYZ0fUzxza9MMH++2K8Zuf/S9+3M8X45unv+9vtIXfgl/b3
223cgWOPfH9+u23dgcHF31+f6n8HzrSvX/W/E4fs8an+d2KZPX7V/078yb4/
qv+duMG+f6r/bJyw76/qPxv/Y99/1X82rrLnR/WfjV57/lT/u7DOnl/V/y70
2vOv+t+Fp+z4UP3vwhQ7flT/OTr/Vf852GjHn+o/BxPs+FT95+j8V/3nwmXH
t+o/F1Pt+Ff95+KwnR+q/1zss/NH9Z+HPju/VP95eMrOP9V/Hobb+an6z9P5
q/qX6PxW/UtgHx9U/Y3PMyVG//k6/1X/+Tr/Vf/5Ov9V//k6/1X/BTr/Vf8F
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
kv9tev9P1f82PEj+t+n9PzX+NlxL/rdhPfnfhgLyvw2Pk/9tvL7d2abzX42/
Tee/Gn8b9pD/bXr/T42/Tee/Gn+b4X+bzn81/na0kf/tsI9r/9sN/9sN/9sN
/9sN/9vxAfnfbvjfjk/J/3bcQuNv1/mvxt+u81+Nv12vr6rxt+Mx8r9dr8+q
8bdjBvnfodd31fg7sJ/mvwMPkf8dOE7+d2A8+d+BA+R/B06S/x0YQ/53oI/8
78BSiv8OfEv+d+B08r8DFeR/B/6N/O/Ab8n/Dqwi/y08If0fZqn1v722/3kW
Zkj/8y3slP47LEyQ9WWUhR7pf4GFs2V9KrTwofQfFt6R9a3IQqGsf8VWLp5E
fSyxcKasn04LR2R9rcz9vay/LgtTZX12W8b6rYV7ZH0PW9gh63+npfeH7PY6
i/f/0xaukb5sthCX/nRZvD7dben8V/XbQoX0rcfCLOlfr8X7432Wzn9V3y3s
kr4OWLz+Pmix/6csw38PWqXvwzywjyv/8zzokJ/ne3CZ7O/w4Fz5/aM8ev9R
zb9H57+afw+OyuuHh/c3ijw6/9X8e9Au70+JB6/I++f06P1VNf8ePC7vv8uD
2XJ+3B7cQPs3Hr2/q+bfo/Nfzb8Hf5Txsc7D+0fp3PllfG324KCMvy4Pzhly
0f/HZ7cH19Pza+58Mr57PFgv47/Xg5dlfvR58FPpf9aDlTK/BjxIS/8HPRgh
8/OUB3XkvxcvSv+HebHxu+TIC84+afuf58VY6X++F09L/x1ePO8U9WWUF5Nl
/Snw4meyPhV6cUD6Dy/ulfWtyItqWf+Kvdgq62OJFz+V9dPpxf/K+lrp5f1X
lxejZH12e7GT1m+92CLre9iLP8v63+lFWvqwLvd90o+0l/eXN3vxgPSny4ur
pE/dXrxAfnn171vsdo8XkP71etEvfezz4qD0M+tl/we87P+gF2dLn095jf17
H/s/zAf7uPI/z/g838f9HT72f5QPz8nzF/jwnry+Qh8+kNcPHz6T4yvyYa4c
f7FP/z5Kzb8Pz8r75/Rhlry/lT78Tt5/l49/n+H2YSbt3/jwmpzfsA+v0Pz7
8LCMj3U+fCzjJ527Xhlfm338+5MuH07J+Oz2wUXPrz5slPHd40O5jP/e3Hw4
RH70+TBD+p/14Su5vzbgw69l/g36cL/0/5QPrc9I//3YLff3hvnV+v9+5b8f
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

           "]]}, 
         {GrayLevel[0], PointSize[0.005555555555555556], Thickness[0.01], 
          Opacity[0.5], LineBox[CompressedData["
1:eJxd2lusdOcYB/CXVGxCjETYF8Q4hCEiU3WYOvV1HueFYtCylDLOC1/bQdWr
6jM+9VlxY8eFLCLNbiIxUpJNPukiwY4ESxo17QWrXJi4kNVIZHpF2Fsy6zc3
O7/9zJM378X7/NdhHnfVx9549f1DCPe7KIT//j35dJc98IpHXPKkW35w4fQf
cf3Hh9579WNvveyEe/H+P3zKhVse9eNTD/Aj8D5+NB7ix+Mn4ifhEX4qfhp+
Oh7ji/Ez8CX4mfhZ+Nn4OXiCL8XPxc/Dz8cvwC/El+HYd8LhRdRxeDF1HF5C
HYeXUsfhZdRxeDl1HF5BHYcpdRxeSR2HV1HH4dXUcXgNdRxeSx2H11HH4fXU
ccjixeud8x2z+OBz33rNpZ/6yfNPvp/FX52c/9v/5zqL9932v/4Thzf0HXHC
NQ5vpB8nXOPwJvpxwjUOl9OPE65xeDP9OOEah7fQjxOucXgr/TjhGocZ/Tjh
Goe30Y8TrnF4O/044RqHd9CPE65xuIJ+nHCNw5X044RrHN5JP064xuFd9OOE
axzy+OL1zvke5vEk/392kv8xjz/azf88j/fetjtPcIVr3OLw7r6HOOIcJ1zh
Grc4XMX6OOIcJ1zhGrc4vIf1ccQ5TrjCNW5xeC/r44hznHCFa9zicDXr44hz
nHCFa9zi8D7WxxHnOOEK17jF4f2sjyPOccIVrnGLwzxevpv/w3l80Cfvuv37
D/vlSf7Hefzubv7n87jpzRdc4Rq3OHyg7yGOOMcJV7jGLQ4fZH0ccY4TrnCN
Wxw+xPo44hwnXOEatzh8mPVxxDlOuMI1bnH4COvjiHOccIVr3OLwUdbHEec4
4QrXuMXhY6yPI85xwhWucYtDEa++a+d8D4rT6/9fn+T/sIhf350P4yL+uTef
cIZzXOCES1zhFa5xg1vc4fDxvgd4iMc44gznuMAJl7jCK1zjBre4w+ET7B8P
8RhHnOEcFzjhEld4hWvc4BZ3OHyS/eMhHuOIM5zjAidc4gqvcI0b3OIOhzPx
urt2zvfgTHzIt99z18//8tuT/B+eiWn3/mB8Jt7Zm084wzkucMIlrvAK17jB
Le5wuKbvAR7iMY44wzkucMIlrvAK17jBLe5wuJb94yEe44gznOMCJ1ziCq9w
jRvc4g6H69g/HuIxjjjDOS5wwiWu8ArXuMEt7nBYxGUv/xen9/+/P83/Rfxo
L/8X8Te9+YcznOMCJ1ziCq9wjRvc4g6HT/U9wEM8xhFnOMcFTrjEFV7hGje4
xR0On2b/eIjHOOIM57jACZe4witc4wa3uMPhM+wfD/EYR5zhHBc44RJXeIVr
3OAWdzhcH7/Zy//r4/Jv197397vvOM3/6+OVvfy/Pv6iN/9whnNc4IRLXOEV
rnGDW9zh8Nm+B3iIxzjiDOe4wAmXuMIrXOMGt7jD4Qb2j4d4jCPOcI4LnHCJ
K7zCNW5wizscPsf+8RCPccQZznGBEy5xhVe4xg1ucYdDit/bzf+9dPr8786T
/B+k+Ord/N9P8UJvPuIRHuMJjniKMzzDOZ7jAi9wwktc4gNc4UO8wke4xse4
wWvc4g3u8BaHz/e9hwd4Hw/xCI/xBEc8xRme4RzPcYEXOOElLvEBrvAhXuEj
XONj3OA1bvEGd3iLw43xp7v5v3dj/M6/zz/uMQ//10n+D26Ml+7m//6N8bbe
fMQjPMYTHPEUZ3iGczzHBV7ghJe4xAe4wod4hY9wjY9xg9e4xRvc4S0OX+h7
Dw/wPh7iER7jCY54ijM8wzme4wIvcMJLXOIDXOFDvMJHuMbHuMFr3OIN7vAW
h5vi73bf7+3ddPr8/+7T/L8pju7czf+b4tnd3w8N8QiP8QRHPMUZnuEcz3GB
FzjhJS7xAa7wIV7hI1zjY9zgNW7xBnd4i8MX+97DA7yPh3iEx3iCI57iDM9w
jue4wAuc8BKX+ABX+BCv8BGu8TFu8Bq3eIM7vMXhbLynl/9n43Ov+dy/wq33
nJ7/s/GRvfw/G7/Tm/94hMd4giOe4gzPcI7nuMALnPASl/gAV/gQr/ARrvEx
bvAat3iDO7zF4Ut97+EB3sdDPMJjPMERT3GGZzjHc1zgBU54iUt8gCt8iFf4
CNf4GDd4jVu8wR3e4rCM/+zl//L0/d+fTs//Mj6gl//L+I3e/McjPMYTHPEU
Z3iGczzHBV7ghJe4xAe4wod4hY9wjY9xg9e4xRvc4S0OX+57Dw/wPh7iER7j
CY54ijM8wzme4wIvcMJLXOIDXOFDvMJHuMbHuMFr3OIN7vAWh3Pxort38/9c
fMJX7v3bPS/bnt7/n+vPh/1zsezNfzzCYzzBEU9xhmc4x3Nc4AVOeIlLfIAr
fIhX+AjX+Bg3eI1bvMEd3uLwlb738ADv4yEe4TGe4IinOMMznOM5LvACJ7zE
JT7AFT7EK3yEa3yMG7zGLd7gDm9xuLl/fb938+n7//9f/98c//KH3fy/mfs/
PMJjPMERT3GGZzjHc1zgBU54iUt8gCt8iFf4CNf4GDd4jVu8wR3e4vBV7v/x
AO/jIR7hMZ7giKc4wzOc4zku8AInvMQlPsAVPsQrfIRrfIwbvMYt3uAOb3E4
H5/cy//z8eMXztzxjxv+//zvfGx6+X8+3tCb/3iEx3iCI57iDM9wjue4wAuc
8BKX+ABX+BCv8BGu8TFu8Bq3eIM7vMXha33v4QHex0M8wmM8wRFPcYZnOMdz
XOAFTniJS3yAK3yIV/gI1/gYN3iNW7zBHd7iUPbf711Unv7+568X/gM23ZM8

           "]]}, 
         {RGBColor[1, 0, 0], PointSize[0.005555555555555556], 
          AbsoluteThickness[1.6], LineBox[CompressedData["
1:eJxd23t4VOWdB/BYtU2ra+dxXRsVcOxSNkXUERAC0vpFFAMohHu4Ty4kISHJ
JJPL5H7mfp9JsQ9Fa7uzbregdXfzdNVii3WkiPFGU6yIPtpOvVSq1mZ32Zr1
gjvb875Pf9/3/MPz4/Cec97L7/c5l+Ga2vZ1uz9XUlJy3gUlJf//p71N3lLC
GzgsNWIHpqb9funZyUOq3WW49MADR5555bCKy/C34Yunz8ocVfE0fFq3/7OK
+8ZV7MTB3UvTNXefUPFX0bDkBx9OLTyp4pnI/+nU1llfeUnFs1AR/yTmfftl
FZfj1L6bg1/7p1dVPBuJ+nXHUpWvq3gO3N7DKz//6m9VfD02vRO869zXf6di
F65+9As7ura+oeIbserCjzIPDL2p4rmY0/f2ynf3vaXieXi8kL07ec/bKp6P
J6vaPO+N/l7FN+HvW+JrO3zvqHgBHl/47dbMmjMqXogboh9f8fO/+4OKK/Cf
oz+ZFnlWx4twbNO/ftjT+q6KF2N3Vcd1c87p+GZs/RAjdw6+p+Il2PTRxTMT
7+j4G7hhVufU/be8r+JvYn9b8KA7pONb8MMPVj1/4BEdA+cWnL3ouhdVbAHW
M/3lF72u9y819i812t+KA/L41q2YS+dfhq3y+qxl2ELXfxvqZf+s23Cc+n87
/luOj3U75tL4LccTcnyt5ZhF438HnpLzY92B4zR/lbhJzq9ViQ00/yswXa4P
awU20vpZiSa5vqyV2EfrbxUKcn1aq3Arrd878axc39ad8ND6vwuvyPyw7sKN
9TJ/VuOLMr+s1Tj3HZl/azAh89NaA/vvjy+x/6xSsdpgxJYR5424ZC367eM/
Ybdfixft89uxtRZnQ3+5PjvOr8UM+/rtuGQdjtv9U+3X6fxX7dfp/Fft12GR
PX6q/Xqd/6r9ep3/qv16nf+q/XqstedPtd+AK+z5Ve03YK09/6r9Bsy114dq
vwG/sNePar8RR+31pdpv1Pmv2m/U+a/ab4TLXr+q/Sad/6r9Jp3/qv0m1Nn5
odpvQrWdP6r9Zmyx80u136zzT7XfrPNTtd+Mg3b+qvbV+MzOb9W+Gn47/1V7
Y3++2mi/BffI42ML5tH5t2CbvL78Fl2/VPutur6p9lvxNPV/K/5Hjk9+K+bR
+G3Dk3J8sQ3/QOO/Dcfl/OS34Wmav+1YKOcX27GJ5n+79kG1347NtH52YK9c
X9iB/bT+duAtuT7zO7Cc1u9OnJDrGzvRRet/J96Q+ZHficWUP7twaVjkF3bh
ywdk/u3Cn2V+5nfBbvfLI/afbhWrzWnEMGK3EVtunf92fcm5df7bcd6t89+O
C25Mo/pVo/Pfjp017D9q2H93jc5/Vc9q2P9cDfufr2H/CzU6/9X5a3X+q/PX
6vxX56/V+a/OX6vzX52/Vue/On8t+5+vZf8LtTr/1fnr8F/SN2cdnpL+oU7n
vzp/Hftp1bGvuTr2N1+n81Odv07nrzp/PUoWCt+d9QhI/2Hsd9fjkGxv1eNe
efxcPebT+euxXV5foRiT/7vRKPvn3I1nqP+78Wc5Pu7duEmOn7UbR+X45nbj
6zT+uzEu56dQPD7534BFcn6dDaim+W/ANXJ9uIv75fqxGuCR6yvXgHtp/TXg
jFyfhQasJP8bcVKub2cjfLT+G/G+zA93I26V+WM14krpf64R18j773wjLp8u
8rPQCPvvX1T+N9mx3pxGDCN2G7HVBJ+sL7kmnJT+55vY/0ITCnWyfu1h/517
UCnrH/aw/+49mC7rp7WH/c/twQ9k/c3vYf8Le7CD6ncz++9sZv/RjHLpg7uZ
/bea8Zj0JdeMmdKffDMelT4VmnEj+dWC/5W+OVt0/qvzt2CP9NHdwn5aLexr
rgUu6W++hX0utBh+78V5C4Xvzr0ISv9h7Hfv1fmvzr8X35XHz+3l+4/8XuyQ
11coxuR/K1pl/5yteJb634pzcnzcrVggx89qxRE5vrlWXEvj34q8nJ9CK54j
/9vgkvPrbMNWmv82fFWuD3cbGuX6sdrQJddXrg2Haf214X25PgttmEv+t+OU
XN/Oduyi9d+OszI/3O24RPpvtaNG+p9rx1zpf74dFTNEfhbaYZ/3tPLfo2K1
OYzYacQuI4YHPbK+VHnYf7cHc2V98nh0/qv65WH/Rz06/1U987D/Yx6d/6q+
edj/CY/Of1XvPKiV9XnSo/Nf1d8OXCnru6OD/Xd26Py3Y1cHjkk/0KHzX/W/
Q+e/6n+Hzn/V/w6d/6r/HfhI+jbawc+/uQ40Sx/HOvj5P9+h81/1v3h86W+h
g32e7GC/SzrxOem7oxMh6b/T2O/qxAOyPTpxnzx+VSf77+7ELnl9nk7spPuX
TrTL/o124jnqfydKviXGZ6wTFXL88p18fzXRiTly/AudfH822YkXyH8vbpTz
6/BiO82/FzPl+nB50STXD7zwyfVV5cURuf7cXkzK9enxYgHdv3rxqlzfo17U
0fr34hOZH2NeXC79z3vRLPNrwotl0v+CF1tniPyc9MI+72vK/y471pvDiJ1G
7DJidME3XdSXqi78Wvrv7tL5b8eeLvxW+m914WlZ30a72P9cF/s/1oUZsn7m
u9j/iS72v9Cl89+OJ7sM/7t1/tuxoxvrZP13drP/rm6d/6o+d+On0peqbnxN
+uPuZv893fr9lep/t85/1f9ufv7NdaNF+jjWjW3Sz3y3vr9W/e9mfwvd7PNk
t85f1f8enC99d/QgLP13GvtdPXhQtkcPvi+PX9WDm+T53T1wy+vzFGO6f+mB
R/ZvtAcvUP97cN63xPiM9WCRHL98j37/p/rfg+vl+Bd68As5P5M9OEH+92Ke
nF9HL3bQ/Pdillwfrl40y/WDXgzK9VXVi7xcf+5enJXr09OLxXT/2ovfyPU9
2osmWv+9uLBB5MdYL66W/ud74ZX5NdGLTdL/QvH6pP+TvbDPW1D+++xYbw4j
dhqxy4jhQz/57zP89xn++wz/fRgn/31YQfXPhyfJf5/Of1X/fHiZ/PfhIPnv
Qx3578NO8r/P8L9P57+q/32G/32G/306/1X/+3T+q/734Sfkfx+/v7b68DH5
36fzX/W/T+e/6n8fPz/n+/T9tep/Hz//F/rY58k+9rukHxeQ//2IkP/Gflc/
fkT+9+Mfyf9+LCD/+1FD/hdj8r8fHeR/P05Q//txPvnfj5vJ/37kyf9+3ED+
9/P7/8l+TJD/A/z+3zGAXTT/Aygn/wewl/wfgJ/8H8BT5P8APiT/B3AL+T+A
N8n/4vFp/Q/gkgbpf/F6yP8BDJL/A2gk/wdwP/k/ALvdG8r/QTvWm8OInUbs
MmIM6vt/Vf8G+f2/e9Dwf5Cf/61Bfv4fHdT5r+rfoM5/Vf8GDf8Hdf6r+jeo
81/Vv0Gd/6r+Der8V/V/yPB/yPB/yPB/yPB/yPB/yPB/SOe/6v+Q4f+Qzn/V
/yGMk39D2Ev+D+n8V/0f4ufriSF+/14YwvfI/yH2u2RY57fq/zCi5P8wLiT/
h/EQ+T+MHPk/jIXk/zDqyP9h1JL/w/CS/8OYoP4Xr4/8H8YS8n9Yv/9T/R/G
jeT/MJ4m/4dxkvwf4ff/jhHU0PyPYDb5P4I28n8EYfJ/BM+Q/yP4mPwfwTLy
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
+g==
           "]]}}, {}},
       AspectRatio->NCache[
         Rational[1, 5], 0.2],
       Axes->{True, True},
       AxesLabel->{None, None},
       AxesOrigin->{0, 0},
       DisplayFunction->Identity,
       Frame->{{False, False}, {False, False}},
       FrameLabel->{{None, None}, {None, None}},
       FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
       GridLines->{None, None},
       GridLinesStyle->Directive[
         GrayLevel[0.5, 0.4]],
       ImageSize->720,
       Method->{},
       PlotLabel->FormBox["\"Window Length = 121\"", TraditionalForm],
       PlotRange->{{0., 1025.}, {-1., 1.}},
       PlotRangeClipping->True,
       PlotRangePadding->{{
          Scaled[0.02], 
          Scaled[0.02]}, {
          Scaled[0.05], 
          Scaled[0.05]}},
       Ticks->{Automatic, Automatic}]},
     {
      GraphicsBox[{{}, {{}, {}, 
         {GrayLevel[0], PointSize[0.005555555555555556], Thickness[Tiny], 
          LineBox[CompressedData["
1:eJxd2nl8lNW5B3Da0oq21nhdCO31dnArWsWoqGERfoBgFNAoAgFZhoSEQFgm
+2R/Z99ncq33SluFERXBBSKiRot1rveqqQvEBUhQcACBiFuslmLr59q5vud8
7vM7/MPnvJMz73ve8zzP933PmZGla+8s/+GQIUN+MHTIkP/73/43OOm0hede
e+mmp3aqA+jbd+aX5b/aMsluDsMPd1y2c9Pw51U7D5OWJtfk9bys2ufijE0r
JnSf6lHtfJy7ZGTLNyN2q/a/4rv1e0b/5N53VNuB9371eP3vU3tU+0JUbNm6
6XBbn2pfjMzCQ6fnLXpftS/F2JM/KVz0m4OqPQqffHfh70K1WdW+HK9Ubh07
/rVDqn0FClyHvv3bWUdUezT2XnD6JV/N/Ei1C7Dh0/iYFW1HVftqvDG+o2J9
+phqX4Mntq288MNnjqv2tbhx+HlV1s4B1R6DyaGvbs4+/bFqX4eHHvz5ZRV/
OKHa1+PGNSOm+Wo+Ue0bsO1F68vthZ+qdiGqX5vwdfNnuj0WNyWu2V3V+Zlq
j8PR4MmhI0d+rtrjsf/KV+dO3qDbE7C34J5/tJ/xhWrfiG0L/7b7vlLdnojz
HxnWMedR3Z6ESy95+6FEn24D7aubjow8qdoWYB8fVJ9PNj6fbPSfgnz5/dYU
bKfzT8V+eX3WVPTT9d+Ej+T4rJswncY/DbXy/ljTsJ3u33RMkvfXmo5NdP9v
xjQ5P9bNmE7zV4Rn5PxaRXiP5v8WPCDjw7oFeyh+bsUYGV/Wrfgzxd8MDMr4
tGZgCsXvTLwu49uaCRfF/yx8JvPDmoURG2T+3IYzZH5Zt2EI5d/tuE7mp3U7
RlP+FuPqPpHfKMYZ0fUzxza9MMH++2K8Zuf/S9+3M8X45unv+9vtIXfgl/b3
223cgWOPfH9+u23dgcHF31+f6n8HzrSvX/W/E4fs8an+d2KZPX7V/078yb4/
qv+duMG+f6r/bJyw76/qPxv/Y99/1X82rrLnR/WfjV57/lT/u7DOnl/V/y70
2vOv+t+Fp+z4UP3vwhQ7flT/OTr/Vf852GjHn+o/BxPs+FT95+j8V/3nwmXH
t+o/F1Pt+Ff95+KwnR+q/1zss/NH9Z+HPju/VP95eMrOP9V/Hobb+an6z9P5
q/qX6PxW/UtgHx9U/Y3PMyVG//k6/1X/+Tr/Vf/5Ov9V//k6/1X/BTr/Vf8F
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
kv9tev9P1f82PEj+t+n9PzX+NlxL/rdhPfnfhgLyvw2Pk/9tvL7d2abzX42/
Tee/Gn8b9pD/bXr/T42/Tee/Gn+b4X+bzn81/na0kf/tsI9r/9sN/9sN/9sN
/9sN/9vxAfnfbvjfjk/J/3bcQuNv1/mvxt+u81+Nv12vr6rxt+Mx8r9dr8+q
8bdjBvnfodd31fg7sJ/mvwMPkf8dOE7+d2A8+d+BA+R/B06S/x0YQ/53oI/8
78BSiv8OfEv+d+B08r8DFeR/B/6N/O/Ab8n/Dqwi/y08If0fZqn1v722/3kW
Zkj/8y3slP47LEyQ9WWUhR7pf4GFs2V9KrTwofQfFt6R9a3IQqGsf8VWLp5E
fSyxcKasn04LR2R9rcz9vay/LgtTZX12W8b6rYV7ZH0PW9gh63+npfeH7PY6
i/f/0xaukb5sthCX/nRZvD7dben8V/XbQoX0rcfCLOlfr8X7432Wzn9V3y3s
kr4OWLz+Pmix/6csw38PWqXvwzywjyv/8zzokJ/ne3CZ7O/w4Fz5/aM8ev9R
zb9H57+afw+OyuuHh/c3ijw6/9X8e9Au70+JB6/I++f06P1VNf8ePC7vv8uD
2XJ+3B7cQPs3Hr2/q+bfo/Nfzb8Hf5Txsc7D+0fp3PllfG324KCMvy4Pzhly
0f/HZ7cH19Pza+58Mr57PFgv47/Xg5dlfvR58FPpf9aDlTK/BjxIS/8HPRgh
8/OUB3XkvxcvSv+HebHxu+TIC84+afuf58VY6X++F09L/x1ePO8U9WWUF5Nl
/Snw4meyPhV6cUD6Dy/ulfWtyItqWf+Kvdgq62OJFz+V9dPpxf/K+lrp5f1X
lxejZH12e7GT1m+92CLre9iLP8v63+lFWvqwLvd90o+0l/eXN3vxgPSny4ur
pE/dXrxAfnn171vsdo8XkP71etEvfezz4qD0M+tl/we87P+gF2dLn095jf17
H/s/zAf7uPI/z/g838f9HT72f5QPz8nzF/jwnry+Qh8+kNcPHz6T4yvyYa4c
f7FP/z5Kzb8Pz8r75/Rhlry/lT78Tt5/l49/n+H2YSbt3/jwmpzfsA+v0Pz7
8LCMj3U+fCzjJ527Xhlfm338+5MuH07J+Oz2wUXPrz5slPHd40O5jP/e3Hw4
RH70+TBD+p/14Su5vzbgw69l/g36cL/0/5QPrc9I//3YLff3hvnV+v9+5b8f
o/ZK//3YIuuHw49ryX8/XiL//YjL/f9CP/Jl/YIfu8h/P8aQ/37Ukv9+TCb/
/ThM/vuxlfzP/T3578d75L8f/07++7Gd6r+ffx+2zo/x5L8fV5P/fsTIfz//
Pq3bj8fIfz/KyX8/ZpL/fsP/3PWT/37Df7/hvx/nkf9+w/+A4X8A9nHtf8Dw
P2D4H+DvHxUw/A8Y/gdwjPwP6N83qfkP4FbyP3d+8j+AV8n/AP++sjKAJ8j/
AOaQ/wEUkv8BbCf/c9dL8x/Ai+R/AG+T/7nzk/8BZMn/3P0h/wMYR/4HcJD8
D2Aj+Z8bL/kfQB75H0At+R/AFvI/gAvJ/wCC5H8Qh8j/IMbVd5wcsuWQyv8g
zif/g9hI/gfRRf4HUUj+BzGU/A+in/wPopP8D2I1+R/EY+R/EKeR/0F8S/4H
0UP+B3Ep+R/EH8n/IDaT/7n+VP+D2ED+576P/A9iKvkfxP3kfxCjyf8gusn/
IGrI/yAmkf9Bw/8gDpD/Qewh/4N4nPwPIo/8Dxr+hwz/Q7CPa/+Nz/NDhv8h
w/+Q4X+Ir68wxNePkOF/CPPI/5Dhf+77yf8QbiP/Q/gD+R/CFPI/hFnkfwg9
5H8Ir9L8h7CJ/A/hBPkfQgn5n+tP/ofwd/I/hDryP/f95H8IK8j/EIaS/yHc
Tv6H8A/yP4SryP8QHiH/Q0iQ/2F8Rf6H1f7fQZX/YfyY/A9jHfkfxuXkfxjP
kv9h+Mj/MM4l/8N4nfwPo4D8D2Mt+R/GRPI/jCz5H8YT5H8Yk8j/MN4h/8NI
kf9hdFH9D2MH+R/GOPI/d73kfxhR8j93veR/GFvI/zCWkf9hzCD/wzhC/ocN
/8N4i/wPs7+DYcP/sOF/xPA/Avu49j9i+B8x/I8Y/kcM/yM4QP5HDP8jPL6i
CI+/OAKL/I/gNfI/wve3MoInyf8I5pL/EZ4/K8LzG47gIM1/BH8i/yMcP+kI
x9fmCA6T/xEMJ/8jHL+Z3N+T/xFsIv8jnB99Ec6fbG7+yP/c/Sf/I5yfpyK4
j/yPYuh+6X8UF8W+PH5o2in1/h/l+pAfRSf5H8Wj5H8UBeR/lOtTYRR7yP8o
4uR/lOtfcZTrY0kUPyL/o1xfK6Ncf11RXEL+R/E8+R/l+h6OGvU/igfI/9z3
kf9R9mVzlP3piuJK8j/KfmWi7FtPFBPJ/yj6yP+o4X/U8D9q+B81/I8a/scM
/2Owj2v/jc/zY4b/MfyC/I+hm/yPGf7HDP9j+Jz8jxn+x/j5qCTGz0/OGG4n
/2P8/OWK8fOZO/f35H8Mr5P/MeP5L8bPh+ti+JT8j2EB+R/j58+uGD+fdsfg
Jv9j/HzbE+Pn394YhpH/Mcwm/2P8fD0Q4+fvwRieJP9j2ED+x/n5flhc7f/r
5/84Du+R/sf5/cER5/eLUXFsJf/jaCH/4/z+gji/3xTFcQX5H0cV+R/n9ydn
HAfJ/zgeJ//j/H7mjvP7mxVHkvyPYxvV/zi/H66L8/tjOo7R5H8cYfI/zu+n
3XFsJv/jKCP/4/z+2xvn9+O+ON4l/+OG/3HD/7jhf9zwP4EW8j8B+7j2P2H4
nzD8Txj+J3j9oSBh+J/AcfI/wesbRQle/yhOwEP+J9BD/id4faUyga3kfwLz
yP8Er99YCV7fCSfwIc1/AhnyP8HrR+kEry9tTuAI+Z9APvmf4PWrTALHyP8E
HiP/E7w+1pfg9bNsAn7yP4EXyP8Er8+dSvD63ZAkfk3+J1G9s+7dz9v1+l8S
veR/Eu3kfxIbyP8krz8WJHl9sjD3feR/EmHyP8nrn8VJXh8tSeK7v0r/k7y+
Wpnk9VdXEheR/0k8R/4neX03nDTWf5O4n/xP4mLyP8nry5uTvP7clcQV5H+S
168zScP/JG4k/5PYR/4nef08m+T19YFkzhPpf9LwP2n4nzL8T8E+rv03Ps9P
Gf6nDP9Thv8p3p8oTPH+BVL4gvxPoYT8T/H+SEmK90+cKRST/ynef3GleH/G
nft78j+FN8j/lLH/k+L9oXUpfE7+p7CQ/E/x/lNXivenulNoJf9TvL/Vk+L9
r94UziT/U5hH/qd4f20gxftvgyk8S/6n8BT538n7e0M71e9/juz8JxMs3tc=

           "]]}, 
         {GrayLevel[0], PointSize[0.005555555555555556], Thickness[0.01], 
          Opacity[0.5], LineBox[CompressedData["
1:eJxd2VuMJGUZxvFPgnE0GltDoI0aClRo0ZBCQAZEeEXR5ly7orYIu7XgOr2K
TOEMTMOMzDfn2jlW9MKOMVoYxCbxUARIGl3DJ4naMVHLEHGWCy3wgg4XpokJ
abxRTDem3j83m99WamsrW8/z1BRn3T598Ogpxpg3nGrM/34d/Te48k23nnbh
OQ8/ePn4N2TkR0+MOCG/++vbXj565iNPjVyRl5RPkzP3y67Kq4998MTDZzw5
9nvkA4+X7cmHlM+Wdx/ZvavSe3rs98tFyufIAeUafB78Yfh82IcvgD8CXwhf
BF8MfxS+BJ6EL4Uvgz8GXw5/HL4CvhIWbQubT+A4bK7Ccdh8Esdh8ykch83V
OA6bT+M4bD6D47Cp4zhsrsFx2FyL47C5Dsdhc71cpo5fj+f/BrmknA97A/Jz
o86XvVGuUvm7SefR3oT8BuN8/3qUbwl03m0gb9n8/vWX3veLUR+4QJ4YnX/l
6PwDsl+2HJAL9ku2B+Tl0d9vZHdATnm8ZHNQzi9bDsoZo/sfn39QLi7bweaz
2gJb2MHmZpwPW9jB5nM4H7awg83ncT5sYQebL+B82MIONg2cD1vYweaLOB+2
sIPNLTgftrCDzZdwPmxhB5tbcT5sYQeb23A+bGEHm0M4/xCe/0Mi5Xy4Qzov
5rDOlxyWm1X+Dus8usPIbyhvnjn51M/f/ttRvr1Q511C3Q9hKA+V+8OGuk/S
UPePC6Vf7qcixPvAEd1v3hF5Z7n/5Ijuw/AI+hJOYQcXsLld24MFDmELp7CD
C9jcgevDAoewhVPYwQVsvozrwwKHsIVT2MEFbI7i+rDAIWzhFHZwAZuv4Pqw
wCFs4RR2cAGbKVx/Cs//lNTL+Qin8D4wpfOVTsnRk+X8Tek8FlM6v6Y5zvvv
R/n2mngfaOp+CJu6P2xT903alG+pvmnK38v9VDR1X5ljut+8Y7r/5JhcUXZ4
TG5Q/QinsIML2HxV24MFDmELp7CDC9h8DdeHBQ5hC6ewgwvY3InrwwKHsIVT
2MEFbL6O68MCh7CFU9jBBWzuwvVhgUPYwins4AI207j+tH7eZVoOlPMRTuu8
2Gmdr3Ra5k6W8zet81hM67yaSN764B0nn37hj6N8VyK8D0S6H/xI94dEYsv9
EkS6f8JIni33UxTpvrKR7rck0v2XRnJN2Vkky6pf4Rwu4AFs7tauwB7swwIH
cAhHsIUTOIUz2ME5XMAD2HwD9w97sA8LHMAhHMEWTuAUzmAH53ABD2Azg/uH
PdiHBQ7gEI5gCycz+nlPZ+SWcj6yGZ0XN6Pzlc9IXM5fMaPzOJjReTWz473/
8yjflVm8D8zqfvBn5a5yf8is7pdgVvdPOCt/KPdTNKv7ys7qfktm5WrVp7O6
H7NZWVf9CudwAQ9gc492BfZgHxY4gEM4gi2cwCmcwQ7O4QIewOZe3D/swT4s
cACHcARbOIFTOIMdnMMFPIDNHO4f9mAfFjiAQziCLZzM4fmfkzvK+cjmdF7c
nM5XPiffLeevmNN5HMzp/JqWxC/e++pLzz0z3v+WzrvX0v3gt+S2cn9IC/vf
0v0TtuQ3av9buq9sS/db0hJR/dfC/rdkU/U/nMMFPIDNfdoV2IN9WOAADuEI
tnACp3AGOziHC3gAm/tx/7AH+7DAARzCEWzhBE7hDHZwDhfwADbzuH/Yg31Y
4AAO4Qi2cDKP539e7lT7P6/z4uZ1vvJ5+Yna/3mdx8G8zq9ZGL/vPzve/wWd
d29B94O/INep/V/QfRIs6P4JF+SE2v8F3Vd2QfdbsiCXq/5b0H2YLcie6n84
hwt4AJtvaldgD/ZhgQM4hCPYwgmcwhns4Bwu4AFsHsD9wx7swwIHcAhHsIUT
OIUz2ME5XMAD2Czi/mEP9mGBAziEI9gu6uc9WZR3qftflFm1/4s6L25R5ytf
lF+p/V/UeRws6vwaKz/8z+5Z733HK6N8T1i8D1jdD1Url5b7w7O6T2pW949v
5bFyP01a3Vdidb/VrTwZlvvU6j5sWPm26le4CUdwC7ZwDCdwG07hDpzBXdjB
PTiH9+EC7sMDeAibJe0JuAJXYQ+uwT48CQtchwO4AYdwE47gFmzhGE7gNpzC
HTiDu7CDe0v6+c+XZOGJUj72l3ReiiWdr/6Szt9gSed1uCR/Ut//l8c/7z83
yvfEMt4HlnU/VJel9mypP7xl3Se1Zd0//rLup8ll3WeyLI+UXV/W/Rcsy4Vl
N+AQbsIR3IItHMMJ3IZTuANncBd2cA/O4X24gPvwAB7CZkV7Aq7AVdiDa7AP
T8IC1+EAbsAh3IQjuAVbOIYTuA2ncAfO4C7sVuRs9e+/op//fEXnY39F1ssu
VnSe+ivyvNr7FZ3H4YrOr1nF/q/qPqisymX3LL5iHnl+vP+ruj+8VTld7f+q
7hv/tT9f7f+q7itZ1f1WX5VM7f+q7sPGqnxP9T/chCO4BVs4hhO4DadwB87g
LuzgHpzD+3AB9+EBPITNmvYEXIGrsAfXYB+ehAWuwwHcgEO4CUdwC7ZwDCdw
G07hDpzBXdjBvTX9/OdrsqP2f03npVjT+eqv6TwO1uRf5bwO17D/6zrfE+vj
739/G+d/XfdBdV3eqPZ/XfdJbV33j7+u+2pyXdpq/9ex/+u6D4N1OU/1PxzC
TTiCW7CFYziB23AKd+AM7sIO7sE5vA8XcB8ewEPYbGhPwBW4CntwDfbhSVjg
OhzADTiEm3AEt2ALx3ACt+EU7sAZ3IUd3NvQz3++ofOyvyHfUfu/ofPV35BT
nyvv/4bO43BD59fE8r6tl198/urheP9j5D/G/se6Tzy4Fuv+8WNJ1P7Huq8k
1v1Wj+XHav9j3YeNWH6k+h9uwhHcgi0cwwnchlO4A2dwF3ZwD87hfbiA+/AA
HsLmuPYEXIGrsAfXYB+ehAWuwwHcgEO4CUdwC7ZwDCdwG07hDpzBXdjBveP6
+c+Pyw/U/h/XeSmO63z1j2P/j2P/YbM5/t7/+v5vIv+buh+qm/LCX8r7v6n7
pLap+8ffxP5v6v6STd1v9U3s/yb6Hw7hJhzBLdjCMZzAbTiFO3AGd2EH9+Ac
3ocLuA8P4CFstrD/cAWuwh5cg314Eha4DgdwAw7hJhzBLdjCMZzAbTiFO3AG
d2EH97aw/1v4+X8L+7+F/d+Sc9X+b+k8Drd0fs029n9b7j4x+8w/H3j95/9t
3Q/VbcnV/m9j/7ex/9vygNr/bd1Xsq37rf6a1f5v6z5sbMtPVf/DTTiCW7CF
YziB23AKd+AM7sIO7sE5vA8XcB8ewEPY7GhPwBW4CntwDfbhSVjgOhzADTiE
m3AEt2ALx3ACt+EU7sAZ3IUd3NvRz3++I4+q/d/ReSl2dL76O/r722BH53G4
o/Nrdsf/v+8f4/3f1Xmv7Oo+qO7KU2r/d3Wf1HZ1//i7+vvk5K7uK9nFz/+7
+P6/q/uwsYvvv3ATjuAWbOEYTuA2nMIdOIO7sIN7cA7vwwXchwfwEDZ7+P4P
V+Aq7ME12IcnYYHrcAA34BBuwhHcgi0cwwnchlO4A2dwF3Zwbw/f//fkl2r/
93Reij18/9+Ta9X+7+k8Dvd0fk0iD51+888evv/fo/0/Nfl/3v8L8elLlw==

           "]]}, 
         {RGBColor[1, 0, 0], PointSize[0.005555555555555556], 
          AbsoluteThickness[1.6], LineBox[CompressedData["
1:eJxd23l8VNXZB/BIqQ1qNaLQoCwjr2hExdRaRaTwU7aIgpHNqCjDEgiEhMk+
2e/sd/a4I24j+tq0H9TUWl+qVKe0tejrEq1LXKqjIiKiDiiKwovN6z3n83l+
J//4OY5nzpx7nuf5nnvu9bQVGxZUDikoKDhqaEHB///T+ctPPyZ275UXtz65
Tf0LHHrz5/sqx/1uutMsxFdXVby95V/bVbsIU958Zc+nJzyn2idj+OiHt96E
l1W7GPbou9bvevV11R6NwuNy//7yrQHVduH9xJ9OD77+jmqPx/d7v689kM+p
9ul4ePatroT7Q9U+A3Un/fZ/HvvnR6pdgukbn308PuFj1Z6IUUctWDy9dZdq
n4NgYaj48F8/Ue1JmPjEFnx7ZLdql+KrYGl5zXl7VPuXGPfaeP/mBZ+p9vko
KDt+2kdr9qr2r3DTo1vDwdrPVfsC3DbujpU7K79Q7V/j24sfm7lu3peqfSEu
D9zYN2N4XrUvwpCzbw5f36Tbk/HRefnIMy/r9sV4YXj1gYtO26faU3DPCfN6
bl6r25fgFx9d8OfNvbo9Fbft3BS/9D3d/g38bS8emHfMftWehj+NXfLilnN0
ezr+cuOT75fN0m3gU3/qh+GLVNsCJr7wys+HXKs/v9T4/FKj/2V4Qn6/dRkC
NP4M3CF/nzXD+P0zcbecnzUTL9L8Z2GnvD7WLPyErt9szJXX15qN7+n6z8Gd
cn2sOdhE61eGYXJ9rTKU0Ppfjn0yPqzLcRbFz1zYMr6suRhD8XcFZsr4tK5A
E8XvlXhcxrd1JX6g+J+HQzI/rHkYT/kzHwGZX9Z8FFH+XYXfyPy0rsKwcpm/
5fAOiPxGOQob3nrm0ROener89+U47OT/Mz+2s+XY4+S/0y64Gic63++0cTX2
n/rj+E7buhqNzu9T/a/G8c7vV/0XYK8zP9V/AQ4681f9F2CLc31U/wVY61w/
1X8hLnKur+q/ECc611/1X4gOZ31U/4UY46yf6r8IHzvrq/ovwhhn/VX/RTgy
58f4UP0XIe3Ej+q/GCknvlT/xfjSiT/VfzFmOfGp+i/GkYk/xq/qvwTvO/Gt
+i/BDif+Vf8l2Ojkh+q/BMOd/FH9r8EtTn6p/teg28k/1f8aPObkp+p/DZ50
8lf1r8AuJ79V/wqc6eS/6m98nq0w+l+LP8rvx7WwaPxrcav8fdlrcRL9/utw
p5wfrsPzNP/r8IG8PtnrUHC2vH7XY468vrgeX9H1vx43y/XJXo9baP2W4idl
Yn2xFONp/ZfiMxkf2aX4L4qfG+CX8YUb8AuKvxswTcZn9gZsoPi9EX+U8Y0b
df6r/oNtmR/ZG3EG5c8ynf+q/zKMGi3zbxlmy/zMLtP5r/q7sWlA5LfLjePu
X/nW9g9fcvyHW+e/Ux/cbnwo/bfcGCbrS8at899pZ93wyPqUcxv+L8fnsr65
luMbWf+wHP8t66N7uc5/Nf5yTJb1NbMcw2X9zS7X+a/GX46xVL9XYJes764V
GCvrP1bo/Ffjr0CP9MNaofNfjb8CeelPdoXOfzX+Cp3/avyVOv/V+CvxnPQP
K3X+q/FX6vxR46/U+a/GX6nzX42/UuenGn+lzl81/iqd32r8VTr/1fjG5+5V
3N9axd+fWaXzX42/Sue/Gn8VTib/K7FJzs9Vif+l+Vfq/FfjV+Io6b9VqfNf
jV+Jb+j6V+JWuT65StxO/q/G0dJ/12qcTuu/Gl/I+HAPfi7jx1rN+8vMapxC
8bcakPGZW4168n8NnpDx7VqDIxT/azA0KfLDvQZny/yx1iAo8yuzBiuk/9k1
mC/zM7fG8L8KT0v/XVWwP2n+bs/b/3L8RxX7767CB9J/qwpnyvqSqcIQWX+y
VVgv61OuCruOlfVrrc5/VX/W4hNZ/7CW/XevxTJZP621uETW18xajJf1N7sW
lqzPubU4l+r3Onwq67trHU6T9R/rcFD6717HfljrEJW+ZNbha+lPdh1mSJ9y
63T8qvGr8bH0zVWt41+NX633/2r8aoyQflrVuF36mqlmf7PVev+vxq/GNvJ7
vd7fq/HX6/2/Gt/43L2e+1vr9f5fjb8ePhp/vd7/q/HX6/2/Gr8G98n5uWr0
/l+NX4NP5PVx1+j9vxq/BrPl9c3U4BBd/xr0yPXJ1eAu8r9W39+p8Wsxkda/
FvtlfLhrcZGMH6sWMRlfmVqcQ/FXi9kyPnO1xv51A56S8e3agMMU/xtQmBT5
4d6AE6X/1gZslvmV2YBqyr8NeEjmZ24DLib/PfjgLZHfRR7EjlwSbpw54Pjv
8uCwrA+lHgxI/+FBjawv5R6cL+uP24OwrE8eDz48VtYvD/vf48FOWf8yHjwi
62OfB9WyfmY9KJP1td+DSbL+5jxIyfqc92AK+V+Hb2R9L6rDJFn/XXUYKn0o
rUNG+oE63C59Ka9DwRThj7uO7/89dfgZ+VWHz6RvPXV4RfqXqcMD0se+Opwq
/czW4W7pa38dItLfXB2ekj7n67Cd/K/Hl9L3onqUSv9dxuel9fib7I96bJPf
X14PW47vrse98vd56jGG9i/1eEjOr6cer9H86/GFvD599ThGXr9sPebJ69tf
j0J5/XOD48v1ydfj9+R/A46X61vUgMm0/g0oCIn4KG3ATBk/aMBGGV/lDZgi
48/dgEUyPj0N8NL+tQHPy/juGRzvcxn/DThO+t/XgBHS/2yDzn81/wY0yPzL
NeB9mZ/5BpSR/40Y+rbI76JGxEccddKRh991/Hc16vx36kNpI46W9QONqJX1
pbwRv5L1x90Iv6xPnkb8W/pvNbL/PY3Iy/qXadT577T7GnX+q/rWqPPfafc3
6vxX9a5R57/Tzjfq/Ff1r0nnv6p/TTr/VT1u0vmv5t+k81/Nv0nnv5p/E4ZM
Ef64m3T+q/k36fxX82/S+a/m34RXpX+ZJjwofexrwmjpZ7ZJ57+af5POfzX/
Jp2fav5NOn/V/JuRl74XNeOX0n+X8XlpM/dHM/4iv7+8GVE5vrtZ57+afzPG
0v6lWee/mn8zXqf5N+NLeX36mnGsvH7ZZsyX17e/GcfI659rRkauT75Z57+a
fwuK5PoWtWAKrX8LhoREfJS2YLaMH7Rgk4yv8hZMlfHnbsESGZ+eFrTR/rUF
L8j47mnR+a/m34ITpf99LRgl/c+2sP/9LeiQ+ZdrwW6Zn/kWnf9q/l6c+bb0
34vZIz96+W/xnPLfi0PkvxdHyH8vKsl/r+G/F13kvxcD5L8XX5D/g23y36v3
/6r+eQ3/vYb/XpSS/17Df6/hf6vhf6vhf6vhf6vhf6vhf6vOfzX/Vj6f9rQa
/rdiL/nfqvNfzb9V57+af6vOfzX/VtxD/rca/reyz/lW9rugTee3mn+bzn81
f+Pz0jb8nfxvw9Pkf5vOfzX/NtxH/rdhHPnfht+S/206/9X8B8cn/9twHPnf
pvNfzX/wc/K/DZvJ/zZsIf/bMZz8b8dUWv92DCX/21FG/rfjbvK/HdPI/3ZU
kP/t6CD/2/ES+d9u+N+OEeR/O8aS/+2G/+0Ikf/t2Ef+t+Ny8r8Dc8n/Duy4
f9btdvZD5X+H4X8HDsj7f3RgKfnfofNf1b8OtJH/HXiN/O8w/O/AXvK/A78n
/zsM/zsM/zt0/qv612H434FLyP9OfEv+d+I8qv+d+Cn534n7yf9O3EH+dxr+
d+r8V/PvNPzv1Pmv5t9p+N9p+N9p+N+p81/Nv1Pvv9X8O9nnfKfhf5fhfxfO
J/+7sI/879L5r+bfpfNfzb8LMfK/Cxnyv0vnv5p/F3rJ/y68QfPv0vmv5t+l
81/NvwtXkf9dOJ7878KD5H8XHiX/u3Ey+d+NabT+3fgZ+d+NK8j/btxH/nfj
UvK/G9eR/93oIv+7+f6/pxvfUvx3YxT5362f/6n5dxv+dyNJ/nfje/K/W+e/
mr+F2ndFfhdaKDu3d+m8Azsd/4ss9r/Ywl7pv8vCQllfSiy9/1f10kKTrE+T
LfRL/2Hx/X+Zheel/+UWemV9rLDYf7fF/ldZGCHrr2ewv6zPXkvnv6q/ls5/
p21bGCXrf4+FU6UPGy1sln5kLJ3/TrvXwj55/txnYYH0aauFQvLL0ud/TnuH
hbekf/0W+z9g8f1zzsKd0tfdFuLS37yl899pH7TY7wIf+17o0/mvPPBhv/y8
2Id/yv4uH+8vSnw8fqlP579afx8myN8PH59vlPnwppx/uQ/75PWp8GGEvH5u
H8rl9a3yoUj67/Fhq1wfrw930/MbH0bK9bV9mE7r74NL+r/Rhwtk/GR8uF/G
V68PM2T89fnglfG51QeL9q8+vCrje4cP/yfjv9+H06T/Az79/E+tv4/93+3D
sWNE/uV9+nxerb8Pk8h/P26S/hf6sWpp6MRhtx1y/C/y45C8Pyge/Fz67/Lj
hTdEfSnxo0/Wn1K/zn+nPdmP76X/8ONp6X+Zn59/lvvxoKyPFX4skPXT7ccV
sr5W+fn5q2dwfFmfvX4Mo/NbP9//236MlPW/x4/P5fn/xsHvk35k/Px8udeP
PfL8uc+PadKnrX4+v876kZO+7fDjWelfvx+3SB8H/Hz+nxtcP+nrbj86pL95
Px6VPh/048/kfwAfS98LAzhD+l9kfF4c4P6uAD//Lwno94/U+gfQI3/f5IB+
/qfWP8DPN8oC+vxTrX+A34+oCPDzE3dAn/+p9Q9gl7z+ngC/n+EN4E56fhNg
/+0AhtP6B/T7P2r9A7hQxk8mgAdkfPUG+P2TvgBmyfjcGkCI9q8BbJLxvSOA
72T89wcwUfo/EMB66X8ugNtlfu0O4D6Zf/kAjh0Q+XkwYNz/B3X+q/UPokD+
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
9H9oD6ZN2D/tpZrnt/0HoMxvKA==
           "]]}}, {}},
       AspectRatio->NCache[
         Rational[1, 5], 0.2],
       Axes->{True, True},
       AxesLabel->{None, None},
       AxesOrigin->{0, 0},
       DisplayFunction->Identity,
       Frame->{{False, False}, {False, False}},
       FrameLabel->{{None, None}, {None, None}},
       FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
       GridLines->{None, None},
       GridLinesStyle->Directive[
         GrayLevel[0.5, 0.4]],
       ImageSize->720,
       Method->{},
       PlotLabel->FormBox["\"Window Length = 141\"", TraditionalForm],
       PlotRange->{{0., 1025.}, {-1.1467304744553641`, 1.146730474455365}},
       PlotRangeClipping->True,
       PlotRangePadding->{{
          Scaled[0.02], 
          Scaled[0.02]}, {
          Scaled[0.05], 
          Scaled[0.05]}},
       Ticks->{Automatic, Automatic}]},
     {
      GraphicsBox[{{}, {{}, {}, 
         {GrayLevel[0], PointSize[0.006944444444444445], Thickness[Tiny], 
          LineBox[CompressedData["
1:eJxd2nl8lNW5B3Da0oq21nhdCO31dnArWsWoqGERfoBgFNAoAgFZhoSEQFgm
+2R/Z99ncq33SluFERXBBSKiRot1rveqqQvEBUhQcACBiFuslmLr59q5vud8
7vM7/MPnvJMz73ve8zzP933PmZGla+8s/+GQIUN+MHTIkP/73/43OOm0hede
e+mmp3aqA+jbd+aX5b/aMsluDsMPd1y2c9Pw51U7D5OWJtfk9bys2ufijE0r
JnSf6lHtfJy7ZGTLNyN2q/a/4rv1e0b/5N53VNuB9371eP3vU3tU+0JUbNm6
6XBbn2pfjMzCQ6fnLXpftS/F2JM/KVz0m4OqPQqffHfh70K1WdW+HK9Ubh07
/rVDqn0FClyHvv3bWUdUezT2XnD6JV/N/Ei1C7Dh0/iYFW1HVftqvDG+o2J9
+phqX4Mntq288MNnjqv2tbhx+HlV1s4B1R6DyaGvbs4+/bFqX4eHHvz5ZRV/
OKHa1+PGNSOm+Wo+Ue0bsO1F68vthZ+qdiGqX5vwdfNnuj0WNyWu2V3V+Zlq
j8PR4MmhI0d+rtrjsf/KV+dO3qDbE7C34J5/tJ/xhWrfiG0L/7b7vlLdnojz
HxnWMedR3Z6ESy95+6FEn24D7aubjow8qdoWYB8fVJ9PNj6fbPSfgnz5/dYU
bKfzT8V+eX3WVPTT9d+Ej+T4rJswncY/DbXy/ljTsJ3u33RMkvfXmo5NdP9v
xjQ5P9bNmE7zV4Rn5PxaRXiP5v8WPCDjw7oFeyh+bsUYGV/Wrfgzxd8MDMr4
tGZgCsXvTLwu49uaCRfF/yx8JvPDmoURG2T+3IYzZH5Zt2EI5d/tuE7mp3U7
RlP+FuPqPpHfKMYZ0fUzxza9MMH++2K8Zuf/S9+3M8X45unv+9vtIXfgl/b3
223cgWOPfH9+u23dgcHF31+f6n8HzrSvX/W/E4fs8an+d2KZPX7V/078yb4/
qv+duMG+f6r/bJyw76/qPxv/Y99/1X82rrLnR/WfjV57/lT/u7DOnl/V/y70
2vOv+t+Fp+z4UP3vwhQ7flT/OTr/Vf852GjHn+o/BxPs+FT95+j8V/3nwmXH
t+o/F1Pt+Ff95+KwnR+q/1zss/NH9Z+HPju/VP95eMrOP9V/Hobb+an6z9P5
q/qX6PxW/UtgHx9U/Y3PMyVG//k6/1X/+Tr/Vf/5Ov9V//k6/1X/BTr/Vf8F
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
kv9tev9P1f82PEj+t+n9PzX+NlxL/rdhPfnfhgLyvw2Pk/9tvL7d2abzX42/
Tee/Gn8b9pD/bXr/T42/Tee/Gn+b4X+bzn81/na0kf/tsI9r/9sN/9sN/9sN
/9sN/9vxAfnfbvjfjk/J/3bcQuNv1/mvxt+u81+Nv12vr6rxt+Mx8r9dr8+q
8bdjBvnfodd31fg7sJ/mvwMPkf8dOE7+d2A8+d+BA+R/B06S/x0YQ/53oI/8
78BSiv8OfEv+d+B08r8DFeR/B/6N/O/Ab8n/Dqwi/y08If0fZqn1v722/3kW
Zkj/8y3slP47LEyQ9WWUhR7pf4GFs2V9KrTwofQfFt6R9a3IQqGsf8VWLp5E
fSyxcKasn04LR2R9rcz9vay/LgtTZX12W8b6rYV7ZH0PW9gh63+npfeH7PY6
i/f/0xaukb5sthCX/nRZvD7dben8V/XbQoX0rcfCLOlfr8X7432Wzn9V3y3s
kr4OWLz+Pmix/6csw38PWqXvwzywjyv/8zzokJ/ne3CZ7O/w4Fz5/aM8ev9R
zb9H57+afw+OyuuHh/c3ijw6/9X8e9Au70+JB6/I++f06P1VNf8ePC7vv8uD
2XJ+3B7cQPs3Hr2/q+bfo/Nfzb8Hf5Txsc7D+0fp3PllfG324KCMvy4Pzhly
0f/HZ7cH19Pza+58Mr57PFgv47/Xg5dlfvR58FPpf9aDlTK/BjxIS/8HPRgh
8/OUB3XkvxcvSv+HebHxu+TIC84+afuf58VY6X++F09L/x1ePO8U9WWUF5Nl
/Snw4meyPhV6cUD6Dy/ulfWtyItqWf+Kvdgq62OJFz+V9dPpxf/K+lrp5f1X
lxejZH12e7GT1m+92CLre9iLP8v63+lFWvqwLvd90o+0l/eXN3vxgPSny4ur
pE/dXrxAfnn171vsdo8XkP71etEvfezz4qD0M+tl/we87P+gF2dLn095jf17
H/s/zAf7uPI/z/g838f9HT72f5QPz8nzF/jwnry+Qh8+kNcPHz6T4yvyYa4c
f7FP/z5Kzb8Pz8r75/Rhlry/lT78Tt5/l49/n+H2YSbt3/jwmpzfsA+v0Pz7
8LCMj3U+fCzjJ527Xhlfm338+5MuH07J+Oz2wUXPrz5slPHd40O5jP/e3Hw4
RH70+TBD+p/14Su5vzbgw69l/g36cL/0/5QPrc9I//3YLff3hvnV+v9+5b8f
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

           "]]}, 
         {GrayLevel[0], PointSize[0.006944444444444445], Thickness[0.01], 
          Opacity[0.5], LineBox[CompressedData["
1:eJxdmntwXGd5xg/UFCUldNOmQWlIs0m5CMqkSxOKkrrJQ2hAuZH1LSjx7UhG
suRg+chaWStLsr69n73vtMxUwzDJgSGu3UvYDJcRNJ2cplOqYVrYQh3ktCHH
YVo0mV42hckotDPU7W463/P4H8/P8rGk733e53fOkW8aP7F74s2O47xph+P8
7++9X9273nrgmlvfc/bzO/t/gB4//UwPB/A337/q1Ykbzz/b4xheIb4GN27a
PIjXv/y+Z86+4+t9fife/RWb4/gN4ptx/VhjJrbxXJ/fhduI34NdxEP4lyen
d65vb/T5/Xj7WZs/gOuJb0H30E1Lr1/3nT4nMHjY5g/i3cS/hTc9ceGWn//M
d/t8KwaIb8NVxB/CP934J/OfbV7o82/jB8QfxiXiYYydf+rsyyubfb4dnyK+
AzPEvyO8U/h3he8UvksYzEbY+Yh8XNi5Wz4u7HxUPi7s/J58XNi5h8/D3IP/
oPP7GJ+n+Zic/8dxvT0f83GZ1wjP04zI/O/F220290p+7uN8mfuwg/J2P+fT
3C/5fQB32GwekPw/iA/b+2EelP35BO+X+QTupv17iPfRPCT7m+zv91/29htJ
3neTxJWVxx+4ffEbvT4Ik/hq7/q7etfvwqbN2IUPblpsduHV3tfX43AX3vwV
i53duMVm7MY7et9///rd+JDN4W7cZbOzBy/3zrd//R44Zy02e3ClzeEe/Gtv
fv3r9+LKwxZjL66x2ezFzx7/v3z0r7/895+w2NmH62zGPvxDL3/96/fhJZvD
ffg3m52HMd7Ld//6hzFps3kYns2hsPNJZggb4VDYGZXrhY1wKOw8ItcLG+FQ
2HlUrhc2j/L5hI/iP+n89vN5Yj+ft9mPG+z5hPt5Xs4BnicO4Jdp/gc4H+EB
yc9BXGHnCwclfwc5n+FB3En5PcT5xiHJ/yHA3o/wEO+Lc5j3C4exl/bvMO9j
eFj218UVcxef/dIvfrO333GX9x0u94Pr4ot2fxiX+yRwuX9CF1t2P0Wu3A+M
cb/Fx/BLdv9hjPvQHZO+HMOLdr8GY9y34Rj3cTSGLervce7z+Dj3PcbxyuOW
H9xx9ocZZ78E43jR9k84zn6KxsVfR3C37bf4EfYdjuCkza6wEQ6EQ+FI2PkU
c1wYwq6wEQ6EQ+FI2JmQzz+BR+jzT/D5uBP4Cfl+gs8zmJDzn+D5RBNyPzfJ
841PYh/Nf5Lz4E5yfswkrrLzFUxy3sJJzmc0iSz5/SjnOX5U8n8UI/Z+uEfl
fuAo71dwFBMX7f07yvsYHeX9dab6+/6t3n7Hp+R+YIr7wZ3i/jBT3DfBFH6f
+mYKL9n9FE1xXznT3G/xae4/THNfutN4kPpxGhftfg2mpW+nuZ+jaenvY9z3
8WO4me4HjmHL9r97jH1hjrFfgmP4R/L9MfZRdEz89Rhg+y3+mNwPPIaUza6w
EQ6EQ+FI2Pk0c1wYwq6wEQ6EQ+FI2Dkun/849tPnP87n4x7Ha+T343yewXE5
/+M8n+g4fo78P8Pzjc/gEZr/DOfBnZH7gxlcbecrmOG8hTOcz2gGRfL/Cc5z
/ATnHSewy94P9wTviznB+xWcwMJFe/9O8D5GJ3hfHQ9v+/yRi8+9/O3efsc8
uR/wuB8SHvcHPBi7X5Ie94/r4Xm7nzyP+8p43G8tj/sv8HCvzW2P+zP0cMHu
144nfetxP3c98f8sbrD7PTbL/R+fxT/bfkjMsi8wyz5JzuKi7R93ln3kzYq/
ZnGn7bfWLPsumGUftoVD4Y5wJNwVdk4yx4TjwglhCCeFXWFP2Ai3hIOTfD7t
k9gmv5/k8+yc5POPTuIt9ny6J8X/czzf2BwO0fznOA+JOc4L5nCtna/kHOfN
neN8enOo0P3rHOe5Ncd5D+bwqL0f7Tnel3CO96szB9/ev2iO97E7x/vqpPq+
//vefsdScj+Q4n5IpDBj9wdS3C/JFPePm8Lf2f3kpbivTIr7rZXCPXb/BSnu
x3aK+zNMoWP3ayclfZvifu6mcJ3d384893tsnvs/Po8f2n5IzLMvMM8+Sc7j
+7Z/3Hn2kTcv/prHTttvrXn2XTDPPmwLh8Id4Ui4K+ycYo4Jx4UTwhBOCrvC
nrARbgkHp/h82qfwU/L7KT7Pzik+/+gU3mrPp3tK/L/A840tYJzmv8B5SCxw
frCAX7XzlVzgvLkLnE9vAU26f13gPLcWJP8LOGLvR3uB9yVc4P3qLOCz9v5F
C7yP3QXeXycN/0enXn/lhe/1/Z/mfY+nuR8SaRy0+wNp8X+a+8dN46/J/2nu
K5PmfmulAeq/tPg/zf0ZpvG35P80922U5n7upvEr9H53Ufy/KP2/iEvk/0X2
BRbZL8nFN97/9b//RfaRt8j+Mou4g/y3yL4LFnGQ/CccCneEI+GusHOaOSYc
F04IQzgp7Ap7wka4JRyc5vNpn8Z/k/9P83l2TvP5R6dxBfn/NM/LWeL5xpYw
SfNf4jwkljg/WMKvkf+XOG/uEufTW8IfkP+XOM+tJcn/Ej5N/l/ifQmXeL86
S/hT8v8S72N3iffXWe7f7z/f9/8y73t8mfshsYz7yf/L3CfJZe4fdxnPkP+X
ua/MMvdbaxk7qf+WuQ/by9yf4TI2yP/L3LfRMvdzdxlXk/9XuM9jK9L/K3iJ
/L/CvsAK+yW5gu+S/1fYR94K+8usYJj8t8K+C1ZwmPwnHAp3hCPhrrBzhjkm
HBdOCEM4KewKe8JGuCUcnOHzaZ8R/5/h8+6cwXPk/zP4BfL/GZ6Xs8rzja3i
GM1/lfOQWOX8YBUB+X+V8+aucj69VfH/Kue9tYrrKP+rSJH/V3lfwlXer84q
/oL8v8r72F3l/XUMvvCzxk03XP1ab78HjNwPGO6HQYPb7f6IG+6TIcP9kzD4
st1Pw4b7Cob7bcTg667Vf0nDfThquD9dw/06ZbiPPYOP2Jw2eBv9PNdwn/uG
+79l8KLthzXDvggM++WcwWds/7QN+2jdiL8M+23D8P8H6BjM2rwpHAlvCXeF
t4WdDPOAcEx4UDguPCScEB4WhvBIBhN0P5Hh8xjNwInb91cZPs+pDJ+/l8H9
9nzSGZ6XyfB8/YzMP8N5Wcvgx/b7oyDD+TqXwXttbmc4j+sZfI7uXzOc540M
57+TwfJXrf3YzPC+RBner60M7183w/u6ncF36P1/tv+8/0Jvvweycj+Q5X4Y
zGLoeas/4lnuk6Es908iy/00nOU+QxbnbR7Jcv8ls7jV5tEs96WbxbN2v05l
pW+z3M/pLGr2+3+T5T73s9z/rSz7YS3LPgmyGLT5XJb9087i2zavZ9lXYRa3
2X7byLLvOlk8bvOmcCS8JdwV3hZ2cswDwjHhQeG48JBwQnhYGMIjwskcn89o
js/TzeGbNk/l+Py9HM8nnUOMfn6T43n6OczR/HOch7Uc5yfI4bydr3M5zls7
x/lcz3Gewxxutnkjx/nv5Hg/NnMo2hzleJ+2crhEvs/xPm7neH+dvPg/z30Q
y+OO+dXXnPOX+v7Pc3/E87iW/J/nvklc/vfJ/3nuK+S530byaJP/89yHo3nu
TzfPfTuVxzD5Py/+z3N/mzx2kP/z3PetPC6S//PsiyDPfjmXR4v8n2cfrefZ
X2GefbeRx3Hyv/CmcCS8JdwV3hZ2CswDwjHhQeG48JBwQnhYGMIjBUyT/wt8
PqMF7CD/F/g8pwp8/l4BD5H/CzwvU+D5+gXOQ6uA/7LzslYQ/xc4b+cK+E3y
f4HzuV7Ak+T/Aud5o8D57xRQJ/8XeF+iAu/XVoH3sXv567X3dbsg/i/yfg8U
++//ftDf/yL3wWARbyH/F7lPhorcP4ki99VwEWvk/6L4v8h9mCzi/eT/Iven
W8TXyP9F7luvyP2cLiJH/i9yn/tF6f8i+2KtiGvI/0Xxf5F91C7iW+T/Ivsr
LCJB/i+y7zpFfIH8LxwJbwl3hbeFnRLzgHBMeFA4LjwknBAeFobwiHCyxOcz
WuLzdIWnSnz+XonnlRY2JZ6vX8Iyzb/EeVgrcX6CEp4m/5c4b+0S53O9xHkO
hTdKnP9Oifdls4Q/JP+XeL+2Stjxgu3/Eu/jdon31/Hx69VXf3Tpnu2+/33Z
f1/873OfxIWHfO6fhI8W+d/nvoLP/Tbi44/I/z734ajP/en63LdTPhLkf5/7
Oe1znxth35f+93GB/O+zLwKf/XLOR43877OP1n32V+iz7zaEO8KbwpHwlnBX
eFvYKTMPCMeEB4XjwkPCCeFhYQiPCCeFR8sYIP+X+Tynynz+Xhl7yP9lnpcp
83z9ssy/LP4XDsri/zLnr13mfK6X8Wfk/zLneaPM+e+U8QT5v8z7EpV5v7bK
4v+y+F/YqfTf97/h/4rsf4X7YbCCly/Y/q9wnwxVuH8SFfF/hfsLFe63kYr4
vyL+F3YreIr8X+G+9Srcz+kKlsj/Fe5zvyL9XxH/V8T/wucq4v+K+F84rOAD
5P8K+65TwVnyv3AkvCXcFd4WdqrMA8Ix4UHhuPCQcEJ4WBjCI8LJKp/PaFWe
/6vi/6r4vyrP/1Xxf1X8X0We5l/lPKxVOT9BFd8g/1c5b+0q53O9Ks//VfF/
Vfxflef/qvi/Kv6v4r3k/yrv43aV99epif9rmH0m9b1/P/PG83+N+2Gwhg75
vyb+r4n/azhD/q9xX6HG/TZymcn/Ne7D0Rr3p1uT5/+a+L8m/q/J839N/F+T
/r/8/ZL/a+yLoMZ+OVeDT/6vsY/Wa+yvsCbP/zXxf02e/4Uj4S3hrvC2sFOX
53/hmPCgcFx4SDghPCwM4RHhZF2e/+u4ivxf5/OcqvP5e3V8kvxf53mZOs/X
r8v7nzrnYa0uz/91ef9f57y16/L8X8fXyP91zvNGnfPfqeNp8n+d9yWq835t
1fn9W7fO+7hd5/11Gv2f9/2w7/8G73uswX0w2MCz5P8G98lQg/sn0eD3k8MN
7is05Pm/Ie//G9yHow15/m/gSfJ/g/vWa3A/pxs4Sf5vcJ/7Den/Br8fXmuw
L4KGPP835P1/g3203pDn/waGyP8N9l2ngT8m/wtHwlvCXeFtYafJPCAcEx4U
jgsPCSeEh4UhPCKcbPL5jDbl/1c0+TynmvL+v4l3kv+bPC/TlPf/TdRp/k3O
w1qT8xM08Vfk/ybnrd3kfK43+edXYZPzvNGU9/9N/Dn5v8n7EjXl/X8T95H/
m7yP203eX6eFL16796mzp3/a8/+O1v/v+/8AYjRUZw==
           "]]}, 
         {RGBColor[1, 0, 0], PointSize[0.006944444444444445], 
          AbsoluteThickness[1.6], LineBox[CompressedData["
1:eJxd23l0m8W5BnBDQ49DWBxoqAMBVFqCW1rqS3tbQ1kekgAmQBBZTVbZ8b7K
i2x5/7TvklkPhVtQC6VmNxRoClwQgVKTspgAwQltEYFLQm6gSthSkhuuWs2c
8z6TfziDMppvlvf9zcynfKemY2ndkUVFRUfMKCr6138Lf3IXHx2946rz+p98
Wv0PHHz72H11p997caFYjE+vqdrxwBubVbkE57/9+p6Pjn9Jlb+FE+Y9uOl6
vKbKpQjPu731w61vqfI8FB+T/ds/tk+rsg3vxh//nv+td1T5DHy196v2z3NZ
Vf4eHrzsJlvcsVOV56PzxN/94dE/v6/KZahtunD88Uc+VOUfoHLrZGXTUbtV
+Yf4w/aDs+Yv+UiVz8ENrtd9nSfuVeVy1C1aceOuhR+r8n/gphsv/9O8hk9U
+Vzc8uyeeftGc6r8Ezg+vfi5S76xT5V/itqzH35434gu/ycmS/c/8stH9qvy
z3DS6JcXl536qSr/HFPzzz4Jli5XYPZxW777s1s+U+XzcDC36PqHduny+Xj1
4/k/nFn+uSr/ApXPHbdibocuX4AXN/ecteluXb4Qv6/63fUvTOnyRfjw0I+b
vvupLl+MTy64afDZWV+oMnBydePtkZNV2QLW3nf/ve7T9eeXGJ9fYtRfgN3y
+60FeIzaX4hJ+XzWQuP5F3H/rEU4TP2/FCfI8bEuxVs0fpehVI6vdRm20Phf
jiY5P9blqKf5q8R/yfm1KvErmv8r4JDrw7oC19P6WYyn5PqyFmMxrb8r0SzX
p3UlXLR+r8Jjcn1bV+FrWv9X46CMD+tqnEHxswQ+GV/WEpRQ/F2DC2V8Wtdg
pl3Grx3uaRHfsKO4e/uzDx//4gWFv2/HoUL8P/vvcsaOPYX4L5SLrsXswvcX
yrgW+0/5d/uFsnUtegrPp+pfi+MKz6/qL8XeQv9U/aU4UOi/qr8UDxTGR9Vf
ipbC+Kn6y1BTGF9VfxkWFcZf1V+GRwvzo+ovQ6wwf6r+cqwuzK+qvxw3F+Zf
1V+OWwvrQ9VfjtrC+lH1V6ChsL5U/RV4sbD+VP0VOv5V/RV4o7B+Vf2VKCms
b1V/pY5/VX8lXinEh6q/UsePqr9Kx5eqv0rHn6q/Ssenqr8K/yjEr6pfhVMK
8a3qV+n4V/WNzzNVRv3r+PtxHR6n9q/DS/L5MtcZz79ax7+qvxpfU/9X6/hX
9VdjG43fGpwixxdr8Bca/zVolvOTWYMmmr+1uEPOL9biNpr/tTr+Vf21Ov5V
/XXaF1V/nY5/VX+djn9Vfx26aP2ux+/l+sZ6Hf+qfr4s4yOzHvMpfjbo+Ff1
N2DuPBl/G3CZjM/MBh3/qr4Dt02L+LY5cMyvN27fvPPVgv9w6Pgv5AeHAzul
/5YDM2V+STt0/BfKGQecMj9lHYb/1fhY5jdbNb6Q+Q/V+K3Mj45qNMn8aVXD
IfNruhoXyPybqcbDMj9nqxGh/F2DZTK/22pwg8z/yJelD44aHf+q/Rod/6r9
GvY/U8P+Z2t0/Kv2N6JY+mbbiK+kf9io41+1v5H9tDayr+mN7G9mI/uc3ajj
V7Vfi3nSd1st+w/jc0ctcrK+Vcvfn67FE9R+LbbI58vWYjH5X4fXZP9sdUb/
63C0HB9HnY5/1X4d5snxTdfp+Fft1+n4V+3X8fwV1fP+zlaP+2n+61Ej14ej
HmNy/Vj1+KNcX+l6XEXrrx5Ncn1m6+En/xvwhFzftgYcpvXfgBkJER+OBpwt
48dqgF/GV7oBNdL/TAOWyPjMNhj+N+IZ6b+tEeFdvf/cs+ONgv9oZP8djXhP
+m814iyZX9KNOFLmn0wjWmV+yjbiw1kyfzXp+Ff5pwm7ZP5DE/vvaMIGmT+t
JqyX+TXdpPf/qv0mHf+q/SbcTPm7GWtkfrc14xaZ/9GMuPTB0Ywa6YeVL0tf
0s34s/Qn04zZ0qdsM94kv1owS/pma9HrX7Xfginpo6OF/bRa2Nd0C/ufaWGf
sy2G3606vlX7rVgn/YfxuaNVx79qvxUfye9Ptxrtt+r4V+236vhX7bdhq+yf
rc3ofxuOk+PjaMPbcvysNsyV45tuY/8zbaiX85NtQx35344xOb+2djxI89+O
Rrk+HO24V64fq13v/1X77VhD669dx79qvx1u8r8DT8n1bevAIVr/HShOiPhw
dGC29N/qwG9kfKU70ELx14F7ZHxmO3Ae+e/Ee9tFfJc4ET38i2DPoumC/zYn
Dsn8UO7EtPQfTrTJ/GJ34lyZfxxOBGV+cjqxc5bMX072f8yJD2T+SzvxkMyP
E069/1f5zYm1Mr9OOXGpzL9ZJyZkfs45cSP534l1Mr+XdOI3Mv/bOhGTPpR3
YrX0A51YI32xd+r9v+p/J0qkT85OHf+q/53s21gn9kv/0p14Sfo40YlLpJ+Z
TmyWvk514kHpb7YT70mfc53YTf53YY70vaQLK6X/NuPz8i58JOujCzvl99u7
8JBs39GFF+TzObuwkPYvXXhZ9m+si/1Pd+n4V/3vwrQcv0wXTpbjO9XF5/9s
FxxyfnJdOv5V/7t1/Kv+d2OC5r8bLrk+yrtxv1w/6MYzcn3Zu7FOrj9HN/vv
7MYA7V+7sUWu77FuFH0s1383jpH+T3RjjvQ/063jX/W/G90y/rLdeFfGZ64b
leR/D2bsEPFd0oPYnCNOPPzgXwv+23p0/BfyQ3kPvinzB3rQLvOLvQc/kfnH
0QOvzE/OHvxN+m/1sP9jPcjJ/Jfu0fFfKE/08Pk/04PVMr9O9WChzL/ZHh3/
hXKuB3eQ/y6sl/m9xIW7ZP63uRCVPpS7dPyr/rt0/Kv+u/j873DheOmT08X+
Wy4d/6r/LuyT/qVd2CJ9nHBhgfQz49Lxr/rv0vGv+u/S8an679Lxq/rfi5Ok
7yW9WCX9txmfl/dyffTiffn99l48LNt39Or4V/3vxSLav/Tq+Ff97+X7j3Qv
jpXjM9Gr41/1v1fHv+p/r45/1f9eVMv5yfUa/vex/yV9Ov5V//vQJ9dHeZ+O
f9X/PmTk+rL3YYNcf44+9t/ZhyHav/bhZbm+x/p0/Kv+92G29H+iD3Ol/5k+
9n8q//0y/rJ92C3jM9en41/1342zdkj/3bjspPdfez6WVf67cZD8d+Mw+e9G
HfnvNvx3Y4T8d2Oa/HfjE/I/Xyb/3Xr/r/Kf2/DfjSry340F5L/b8N+NX5H/
/Xr/r/JfP+6m/N+PCPnfjyryv9/wvx8vkP/9Ov5V//sN//sxk/zvR47869fx
r/rfr+Nf9b8fz5P//Yb//exzrp/9LhrQ8a36P6DjX/Xf+Lx8AHvI/wF8QP4P
6PhX/R/An8j/AVxK/g/w/cbYAL//SA/o+Ff9H8AO8n9A3/+p/g8Y/g/o85nq
/4Bx/z9o+D+IR2n+BzFA/g8a/g9iM/k/iBryfxCN5P8gRsj/QbxK/g8a/g9i
Dvk/iNPI/0HD/0EEyP9B7CP/B3EF+T+ExeT/ECZ/fekt4cxO5f+Q4f8QPpfn
fwxhLfk/pONf5b8hDJD/Q3iT/B8y/B/CXvJ/CPeR/0OG/0NYSf4PAeT/kOH/
EG4n/4dxHfk/rONf5f9hhMn/Yawi/4cN/4d1/Kv+D+M48n/Y8H9Y3/+p/g/r
+Ff9Hzb8Hzb8H9bxr/o/rPffqv/D7HNu2PB/xPB/BFXk/wi+Tf6P6PhX/R/R
8a/6P4IJ8n9Ev59U/R/R8a/6P8L3/2MjOET9H8Ex5P8ItpP/IziB/B/h/Vd2
BBvJ/xE0kP+jhv+jeIzmfxRD5P+o4f8o3if/R1FL/o/q+Ff9H9Xxr/o/yuf/
sVF8Set/FHPJ/1H9/k/1f9TwfxQJ8n8UX5H/ozr+Vf8ttP9VxHexhcofja+9
+vMPCv6XWOx/qYW90n+bhWUyv5RZev+v8qUFl8xPFRampP+w+PxfaWGL9N9u
YVzmxyqL/XdYOv4L5UYLFTL/Oi28IfOz28Iv6f7WwiqZ38MWkjL/j1l8/3+r
peNf5WeL/R+3cL/0Z8LCHOnTJov9z1g4Uvo2aen3XyqfW/x+fNrC5dLPrMX+
77b0+zeV7y3skj4fsIz39x5+v1/s4fv/Eg/f/5d6sE/Wt3n49wVlHm6/3MP3
/xUeXCOfHx72v9LD7//tHnxbjk+VBzvl+Dk8OFWOb6MHT8rxd3owJOfH7cF6
en/jYf/DHh3/av49GJHr41YP4nL9pD14Wa6vcQ8a5fqb8OA2uT43eeCl/asH
W+X6nvTg/+T6n/LgO9L/aY9+/6fm38P+7/Zg1qki/nIefT+v5t+Dc8h/L66X
/hd7Ubs2MHvmzQcL/pd4cVCeD0rzn0v/bV68vE3klzIvJmT+Kffq+C+UK7z4
SvoPL56R/ld6+f2n3Yu7ZX6s8mK5zJ8OL9plfm306vd/Kt96MSXzs9uLDXR/
60WbzO9hL/s/5mX/b/Wy/2kvGqUv4148K/2Z8GKW9GmTF1vJLy++KX2b9OIT
6d+UF29KH6e9WCn9zOa/T/q6Oz+e0t+cFznp84H8+JP/PsyXvhf70Cj9LzE+
L/VxfZsPn8nvL/Phedl+uY+fr8LHzw8f/i77V+nDCftE/+0+Hp8qH16V4+fw
6d//qPn34b/l+Dt9fP/v9qGZ3t/4cI+c37BP3/+q+ffp+Ffz79Pxr+bfh6Id
Yn2N+9Aq19+Ej/3f5EOA9q8+3CbX96QP/5Trf8qHH0j/p/PfL/3P+nCLjK/d
Ptwp4y/nw6xpEZ8HfMb536/jX82/H0XyT4kfC+X7/1I/3x/a/Kgg//14Rb7/
L/fjHPLfj6Nk/oIfP5L5rdKPF8l/PxrJfz/C5L8freS/n9//O/14nfz38++3
LD+Wkv9+uCj/5/8++e/HCvLfjxby34/7yH8/ZpD/fv79Wsav97cq//txxD7p
v599nPbz+Tnr5/v/3X5+/5/zs88H/PiY/A9gLvkfwBryP6B//6PmP8Dv/20B
w/8At18e0O8n1fwHsIT8D/D9f2WA9z/2/POR/wF8QP4HcBr5HzD8D2CE/A+g
g/wPIEX+B/j3f2MBvf9X8x9AkvwP4C/kf0DHv5r/AO4k/wMIkv8BbCP/A4b/
AXyf/M8/P/kfMPwP4CG5/84FcDr5H8DPyf8gDpH/QaTPbFty6OlH1P4/iAXy
/X9pEEvJ/yDOJ/+Dhv9B3E3+B/E1+R/Ek+R/0PA//zzkfxB28j/Iv69qDOr9
v8r/QcP/INaS/0FcSf4H8VvK/0HcRP4H9f2fyv9Bw/8gMuR/EEeT/0H9+1+V
/4M4ivwPYi/5H8Rb5H8Qq8j/IN4g/4OG/0HD//x8k/8hnEX+hwz/jc9LQ1zf
FsLn5H8IL5D/IX6+ihA/P0J4l/wP4VvkfwgzyP+Q4X+I7/8bQ7z/coYM/0No
Jf9DGCf/Q8b8h+Aj/0P8+9F0/vnI/xCc5H/I8D+kf/+j5j+EO8j/kI5/Nf8h
w/8QXOR/KO+99D/E8ZcL4VTyP2T4H9bxr+Y/jCL5pyQMG/kf5vtDW5jPF2Vh
PE3+hzGf/M+3R+f/sOF/GJvJ/zBqyf+w4X/Y8D9snP/DeIX8Dxv+h7GE/A+j
k/J/mH24NYxl5H++ffI/jHHyP4xvkP9h/v1aJmz4nx9/8j/MPk6H9fszlf/D
eI78D/Pv/3Nh/A/5H8Ze8j+CUvI/gtXkf4TvB0oj/PtBW4S/vyzC7ZdHDP8j
uJr8jxj+R7j/9nz75H8EH5L/EdjI/4jhfwQW+R9BJ/kfMfyP4E6a/wiGyf8I
r590hNfXeATt5H8Ed5H/EUTJ/wh2kP8Rw/8IziX/I+gj/yOG/xE8Qf5HjPN/
xHj/H8Vp70j/o6jvXnzHDYe/Vuf/KOeH0ihA/kdRRv5H8Qj5H+X8VBHFQfI/
ikfJ/yjnP3uU82NVFFeR//nnJf+j+Cn5H9X7f5X/o6gi/6O4nPyPGvk/qu//
VP6PGv5H2ZfxqHH+j2Im+R9lvzJR9m0yiv8l/6PYRv7n2yf/o3iT/M+3T/5H
sZ/8jxr+x1BG/sfQTP4bn5fGDP9j+IL8j+FF8j/Gz1cR4+dHDFnyP4Y55H/M
8D/G+ydHzPA/xvsvZ4z3Z+6Y4X8M95L/+TLNfwwh8j9m+B9DMfkfQw/5HzP8
jyFC/sd4fzsZ4/3vVEzHv5r/GPrJ/xjvr3fHsJn8j+Ec8j9m+B/H6e9I/+M4
/8uGM5+67Tm1/4/j0Dbpf5zPD7Y4ny/K4niM/I/jVPI/js/I/zjOIf/jeIb8
j2MD+R83/I/z+9XG/POR/3E+n7njfH6z4ria/I/DSfk/jgT5H8e15H/c8D+O
e8j/OI4k/+OG/3H9+1+V/+PG/X/c8D9unP/jxvk/bpz/48b5P26c/xPG+T9h
nP8Txvk/YZz/E8b5P2Gc/xPG/X/CuP9PGPf/Cb7/sCcM/xPYRf4ncAb5n8Af
yf8EPOR/Al3kfwJJ8j/Bv/8cy9cn/xOG/wm+XxpPoJP8z38f+Z9vj/xP4O/k
f8LwP4Hzyf8ELPI/YfifwCT5n+D7uQMJw/8k6sj/pI5/5X9Sx7/K/0n8mPxP
opT8Txr+J/l+siKJ/eR/0vA/yfef9iTfj1YlDf+TqCb/kygn/5PYSv4nsZz8
T2Ih+Z/EPZT/k/r+T+X/JFaS/0nD/yTfP08kUUz+Jw3/k/r9n8r/Sewh/5OG
/0nD/6ThfxIZ8j9p+J/EYfI/he+T/ynDf+Pz0hTXt6VwgPxPGf6nsI38T2E1
+Z/CTvI/hZPI/5Thf4rfnzhS+t//qPlPGef/FP/7P3cK7eR/yjj/p/AAzX8K
UfI/Xyb/UziW/E/BTf6n0ED+p5Ag/1P8fmsyZfifwgXkfwoe8j+Fu8j/FN4k
/1MA+Z8y/B9DWPo/YwwXnbn/olfbtjz9/7BRlH8=
           "]]}}, {}},
       AspectRatio->NCache[
         Rational[1, 5], 0.2],
       Axes->{True, True},
       AxesLabel->{None, None},
       AxesOrigin->{0, 0},
       DisplayFunction->Identity,
       Frame->{{False, False}, {False, False}},
       FrameLabel->{{None, None}, {None, None}},
       FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
       GridLines->{None, None},
       GridLinesStyle->Directive[
         GrayLevel[0.5, 0.4]],
       ImageSize->720,
       Method->{},
       PlotLabel->FormBox["\"Window Length = 161\"", TraditionalForm],
       PlotRange->{{0., 1025.}, {-1.3826834323650936`, 1.3826834323650905`}},
       PlotRangeClipping->True,
       PlotRangePadding->{{
          Scaled[0.02], 
          Scaled[0.02]}, {
          Scaled[0.05], 
          Scaled[0.05]}},
       Ticks->{Automatic, Automatic}]},
     {
      GraphicsBox[{{}, {{}, {}, 
         {GrayLevel[0], PointSize[0.006944444444444445], Thickness[Tiny], 
          LineBox[CompressedData["
1:eJxd2nl8lNW5B3Da0oq21nhdCO31dnArWsWoqGERfoBgFNAoAgFZhoSEQFgm
+2R/Z99ncq33SluFERXBBSKiRot1rveqqQvEBUhQcACBiFuslmLr59q5vud8
7vM7/MPnvJMz73ve8zzP933PmZGla+8s/+GQIUN+MHTIkP/73/43OOm0hede
e+mmp3aqA+jbd+aX5b/aMsluDsMPd1y2c9Pw51U7D5OWJtfk9bys2ufijE0r
JnSf6lHtfJy7ZGTLNyN2q/a/4rv1e0b/5N53VNuB9371eP3vU3tU+0JUbNm6
6XBbn2pfjMzCQ6fnLXpftS/F2JM/KVz0m4OqPQqffHfh70K1WdW+HK9Ubh07
/rVDqn0FClyHvv3bWUdUezT2XnD6JV/N/Ei1C7Dh0/iYFW1HVftqvDG+o2J9
+phqX4Mntq288MNnjqv2tbhx+HlV1s4B1R6DyaGvbs4+/bFqX4eHHvz5ZRV/
OKHa1+PGNSOm+Wo+Ue0bsO1F68vthZ+qdiGqX5vwdfNnuj0WNyWu2V3V+Zlq
j8PR4MmhI0d+rtrjsf/KV+dO3qDbE7C34J5/tJ/xhWrfiG0L/7b7vlLdnojz
HxnWMedR3Z6ESy95+6FEn24D7aubjow8qdoWYB8fVJ9PNj6fbPSfgnz5/dYU
bKfzT8V+eX3WVPTT9d+Ej+T4rJswncY/DbXy/ljTsJ3u33RMkvfXmo5NdP9v
xjQ5P9bNmE7zV4Rn5PxaRXiP5v8WPCDjw7oFeyh+bsUYGV/Wrfgzxd8MDMr4
tGZgCsXvTLwu49uaCRfF/yx8JvPDmoURG2T+3IYzZH5Zt2EI5d/tuE7mp3U7
RlP+FuPqPpHfKMYZ0fUzxza9MMH++2K8Zuf/S9+3M8X45unv+9vtIXfgl/b3
223cgWOPfH9+u23dgcHF31+f6n8HzrSvX/W/E4fs8an+d2KZPX7V/078yb4/
qv+duMG+f6r/bJyw76/qPxv/Y99/1X82rrLnR/WfjV57/lT/u7DOnl/V/y70
2vOv+t+Fp+z4UP3vwhQ7flT/OTr/Vf852GjHn+o/BxPs+FT95+j8V/3nwmXH
t+o/F1Pt+Ff95+KwnR+q/1zss/NH9Z+HPju/VP95eMrOP9V/Hobb+an6z9P5
q/qX6PxW/UtgHx9U/Y3PMyVG//k6/1X/+Tr/Vf/5Ov9V//k6/1X/BTr/Vf8F
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
kv9tev9P1f82PEj+t+n9PzX+NlxL/rdhPfnfhgLyvw2Pk/9tvL7d2abzX42/
Tee/Gn8b9pD/bXr/T42/Tee/Gn+b4X+bzn81/na0kf/tsI9r/9sN/9sN/9sN
/9sN/9vxAfnfbvjfjk/J/3bcQuNv1/mvxt+u81+Nv12vr6rxt+Mx8r9dr8+q
8bdjBvnfodd31fg7sJ/mvwMPkf8dOE7+d2A8+d+BA+R/B06S/x0YQ/53oI/8
78BSiv8OfEv+d+B08r8DFeR/B/6N/O/Ab8n/Dqwi/y08If0fZqn1v722/3kW
Zkj/8y3slP47LEyQ9WWUhR7pf4GFs2V9KrTwofQfFt6R9a3IQqGsf8VWLp5E
fSyxcKasn04LR2R9rcz9vay/LgtTZX12W8b6rYV7ZH0PW9gh63+npfeH7PY6
i/f/0xaukb5sthCX/nRZvD7dben8V/XbQoX0rcfCLOlfr8X7432Wzn9V3y3s
kr4OWLz+Pmix/6csw38PWqXvwzywjyv/8zzokJ/ne3CZ7O/w4Fz5/aM8ev9R
zb9H57+afw+OyuuHh/c3ijw6/9X8e9Au70+JB6/I++f06P1VNf8ePC7vv8uD
2XJ+3B7cQPs3Hr2/q+bfo/Nfzb8Hf5Txsc7D+0fp3PllfG324KCMvy4Pzhly
0f/HZ7cH19Pza+58Mr57PFgv47/Xg5dlfvR58FPpf9aDlTK/BjxIS/8HPRgh
8/OUB3XkvxcvSv+HebHxu+TIC84+afuf58VY6X++F09L/x1ePO8U9WWUF5Nl
/Snw4meyPhV6cUD6Dy/ulfWtyItqWf+Kvdgq62OJFz+V9dPpxf/K+lrp5f1X
lxejZH12e7GT1m+92CLre9iLP8v63+lFWvqwLvd90o+0l/eXN3vxgPSny4ur
pE/dXrxAfnn171vsdo8XkP71etEvfezz4qD0M+tl/we87P+gF2dLn095jf17
H/s/zAf7uPI/z/g838f9HT72f5QPz8nzF/jwnry+Qh8+kNcPHz6T4yvyYa4c
f7FP/z5Kzb8Pz8r75/Rhlry/lT78Tt5/l49/n+H2YSbt3/jwmpzfsA+v0Pz7
8LCMj3U+fCzjJ527Xhlfm338+5MuH07J+Oz2wUXPrz5slPHd40O5jP/e3Hw4
RH70+TBD+p/14Su5vzbgw69l/g36cL/0/5QPrc9I//3YLff3hvnV+v9+5b8f
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

           "]]}, 
         {GrayLevel[0], PointSize[0.006944444444444445], Thickness[0.01], 
          Opacity[0.5], LineBox[CompressedData["
1:eJxdmnuQZHV5ho9mjQMRbRKCQ5DQYNSJsUgbMA6EwCuKDjfp5TrAXs7uMruz
u+xsz73nfvp+755KrHLKSkFLyWYxCWkiUiOS0CEVM0UZ7KDgLAboxYpOUbk0
SYoaTKrMJt2kfs/nP9YjtvW7vN/7nHPGS/Yfv23k3Z7nvWuH5/3vv3f/1bn2
vbvOu/yjJ756de8/UJcff7qLffq7H57z5sjFjz7T5ZDeAJ+nizdd7tfb3/jN
p0988Fs9/pA+8oTLYf0W+FJduK86Ftp4tse/oSvAH9VO8IB+8sjhq9e3N3r8
cb3/hMuf0IXgy9TZc8nC2xd8r8cR9e91+ZP6CPh39K6HXrzsF7/0Qo8vVx/4
Cp0D/pT+8eI/mf5K7cUe/65eBX9ap8GD2vfoYydeX9rs8ZW6H3yVxsC/p2/v
On1WaPePeny1/gr8+9oAX6Pvgq81LHJg2PuM+eeGvevMPzfsfZbrCT5r1vs5
Tbj7Cz5n9ns9zyO4Xv+G8/s8zzP4vDn/L+hC936CL5j7GuJ9BkPm/m/Q+10O
bjD5uZH5Cm7UDuTtJuYzuMnk92Zd5XJws8n/Lfq0Ox/BLWZ+vsj5Cr6o6zB/
t3Ieg1vN/EZ78/3X3flWlPMeRHV28cGbr5x7qtsHzai+2f39td3f79Smy9qp
T246HOzUm931dbm5U+9+wmHvNl3msm7TB7v77/3+Nn3K5eZtutZl73a93j3f
3u9vl3fC4eB2ne1y83b9c/f+er+/Q2fvdVh36DyXgzv08wf/Lx+935/57z/k
sHenLnBZd+oH3fz1fn+nXnO5eaf+xWXvLu3v5rv3+7t00OXgLsVcbt6lp7vz
0/v93Wq6rLv1nMvB3Xre5aZhb5gsw4HhpmHvHvN7w8E9XE/zHrP+ezWF/d/L
/Qb38nya9+rfcX738Tx1H887uE8XuffTvI/35e3ifWqXfgX3v4v5aO4y+dmt
s9x8abfJ327ms7lb1yC/e5hv7TH53yO589Hcw3nx9nK+tFd3YP72ch6be838
+jpr8tQzf/6B73TnO+xz3uWzH3xfX3P7I/DZJ3Wf/dP0teX2U9s3zwP72G/h
ffplt/+0j33o7zN9uU+vuP1a38e+be5jH7f3aQv9vZ99Ht7Pvtd+vfGg4wd/
P/0R7Kdf6vv1iuuf5n76qb3f+OuArnP9Fj5A3+kA/egf0FPw6QH6tH6A/m0e
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
febPrA/3n2Ie1lLMTz2lR918nUwxb40U87meYp6bKV3q8kaK+W+lOB+bKWVd
bqc4T1spnYbvU5zH7RTn10sb/6fZB6G0rppeect79HTP/2n2Rzit8+H/NPsm
cuZ/H/5Ps6+UZr8NpdWA/9Psw+E0+9NPs29H0xqE/9PG/2n2d5DWDvg/zb5f
TesU/J+mL+pp+uVkWqvwf5o+Wk/TX800fbeR1jH4P238n6Y/22l9Hf5P07cd
w9uGvQy5z3DIcL/hsOGBDNcTyegE/J8x/s9wv0MZHYb/Mzyf4Yx2wP8Znudo
hucfy+hW+D/D+woyvN98hnlYzei/3LysZYz/M8zbyYx+G/7PMJ/rGT0C/2eY
540M89/KqAL/Zzgv7QznayvDeeycWa87r9sZ4/8s57sv2/v+92pv/rPsg/6s
3gP/Z9knA1n2TyTLvhrMag3+zxr/Z9mH0aw+Dv9n2Z9+Vk/C/1n2bSzLfo5n
lYL/s+zzfNb0f5a+WMvqPPg/a/yfpY8aWT0H/2fpr2ZWEfg/S9+1svTjZlbH
4f8sfbqVpX87Wb0O/xv2cuQ+wyHD/YbDhgcMR3Jcz2CO61dOJ+D/HPcbzfF8
hnM8T9/waI7nH8vxvuKGgxzvN5/TIu4/xzys5Zifek6Pw/855q2RYz7Xc8xz
0/BGjvlv5Tgvmzl9Gf7Pcb62ctrxsuv/HOdxO8f59fL6cOnNn56+frvn/7yZ
/7zxf559EjY8kGf/RPJahf/z7Cvl2W9Def0x/J9nHw7n2Z9+nn07mlcE/s+z
n+N59nlgOJ83/Z/Xi/B/nr6o5+mXk3mV4f88fbSep7+aefpuw3ArTz9u5unT
tuGtPP3bMbxt2CuQ+wyHDPcbDhseMBwpGP8bVsH4v2D8b3i4oD74v8DzHC3w
/GMF3Q7/F3hfQYH3my+Y+y8Y/xuuF4z/C8xfo8B8rhf0Z/B/gXneKDD/rYIe
gv8LnJd2gfO1VTD+Lxj/G/aKve/97/i/aOa/yH7oL+r1F13/F9knA0X2T6Ro
/F9kf6nIfhsqGv8Xjf8N+0U9Bv8X2bexIvs5XtQC/F9kn+eLpv+Lxv9F43/D
J4vG/0Xjf8PNoj4B/xfpu1aRftws6ij8X6RPt4r0b6eon8D/hr0Suc9wyHC/
4bDhAcOREtczWOL6VdLX4f8S9xst8XyGS+b9v2T8XzL+L5n3/5Lxf8n4v6Q0
7r/EPKyVmJ96SU/B/yXmrVFiPtdL5v2/ZPxfMv4vmff/kvF/yfi/pI/B/yXO
43aJ8+uVjf/LGn966vv/uvzO+3+Z/dBfVgv+Lxv/l43/y1qG/8vsK5XZb0Nn
GP4vsw+Hy+xPv2ze/8vG/2Xj/7J5/y8b/5dN/5/ZL/xfpi/qZfrlZFl5+L9M
H62X6a9m2bz/l43/y8b/ZfP+Xzb+Lxv/l837v2GvYt7/DYcM9xsOGx4wHKlw
PYMV8/5fMd//K9xvtGLe/ys6B/6v8DxHKzz/WEV3w/8V3ldQ4f3mK+b7T4V5
WKuY9/+K+f5fYd4aFfP+X9GT8H+Fed6oMP+tih6H/yucl3aF87VV4fe3ToXz
uF3h/HrV3t/7ftzzf5XzHqqyD/qregb+r7JPBqrsn0iV3ycHq+wrVc37f9V8
/6+yD4er5v2/qkfg/yr7NlZlP8ermoD/q+zzfNX0f5Xfh9eq9EW9at7/q+b7
f5U+Wq+a9/+qBuD/Kn3XqtKPm1Udgv+r9OlWlf7tVPUG/G/Yq5H7DIcM9xsO
Gx4wHKlxPYM1rl81PQb/17jfaI3nM1wz//+KGs9ztGa+/9f0Ifi/xvsKaub7
f00V3H+NeVirMT/1mv4G/q8xb40a87le49+vmjXmeaNmvv/X9G34v8Z5adfM
9/+aboT/a5zH7Rrn11vV186/47ET8z/r+n/H6v/P+/8AV4w83w==
           "]]}, 
         {RGBColor[1, 0, 0], PointSize[0.006944444444444445], 
          AbsoluteThickness[1.6], LineBox[CompressedData["
1:eJxd23d0XNWdB3BBTI6MKTJtRTAwYYOjAGG1tAiH8gUbEM0IV+E6llWtNioj
jfqb3mdE8xpIYAKEFV0QIAQIHkwCwqEI02SThInhgHEMOzbNYK/Z2bx7z/l9
r//hXMb3vbnv3u/v8+574x/XtC+oO7ioqOigaUVF//9f+0/+4kNjd15zft8z
z6n/gX3vHb677uT7L7abxfjiuuptD721SbVLMOe9N3d+euQrqn0Mjpr18NM3
4g3VLkVk1h0tH295R7Vnofiw3N/+Z+uUajvwQeLJnwTeeV+1T8F3u75r+yqf
U+2f4OHLb3EknNtVezY6jv7v3z/+8oeqXYbapgvHnnzsY9U+DZVbJiqbDtmh
2mfg91v3zZg9/1PVPhM3ud/0dxy9S7XLUTdv8c2fzP1Mtf8Tt9x8xZ9nNXyu
2mdh/cads3aP5FX7bDi/uPiFS36wW7XPQe3pjz66e1i3z8VE6Z7Hbntsj2qf
h+NGvrm47MQvVPsXmJx9+nGwdLsCM4/Y/O/nrf9Stc/Hvvy8Gx/5RLfn4PXP
Zp8xvfwr1f4lZrW9//BHs79W7Qtwe/slln+Fbl+I2CHdO9MR3b4Iz9+//4XP
H9Dti/HSp863Yy/qNrDn8HO/XLRFtS3g7KWeg+e9pz+/xPj8EqP/pdgoj29d
igSdfy7ukt/Pmmt8/3k8PmseDtD4L8NR8vpYl+Edun6Xo1ReX+tybKbrfwWa
5PxYV6Ce5q8Sv5Lza1Xi1zT/V8Ip14d1JW6k9XMVnpXry7oKV9H6uxrr5Pq0
roab1u81eEKub+safE/r/1rsk/mwrsUplJ/58Mt8WfNRQvm7DhfKfFrXYXqV
zG8VPFMi36hCcdfWjY8e+dIF9t+vwn47/xv/1c5WYaedf7tddD1m2se327ge
e0741/nttnU9uu3vp/pfjyPs76/6L8Aue3yq/wLstcev+i/AQ/b1Uf0XoNm+
fqr/QtTY11f1X4h59vVX/RficXt+VP+FiNvzp/ovwjJ7flX/RbjVnn/VfxE2
2OtD9V+EWnv9qP6L0WCvL9V/MV6y15/qv1jnX/VfjLfs9av6L0GJvb5V/yU6
/6r/Erxm50P1X4If2flR/ZfiV3a+VP+liNv5U/2X6nyq/kt1flX/ap1v1b8a
59j5V/2Nz7PVRv8bkJXHxw06/6r/DcjI75e9Qedf9V+GN+T4sAzf0/iX6fyr
/svwLl2/5ThBXl8sx1/o+i/HOjk/2eVoovlbgTvl/GIFbqf5X6Hzr/qv0PlX
/VdqX1T/lTr/qv9KnX/VfyU6af2uwu/k+sYqnX/Vv9CW+ciuwmzKz2qdf9V/
NY6fJfO3GpfLfGZX6/yr/k7cPiXy7XDisN+s3bpp++u2/3Dq/Nv1wenEdum/
5cR0WV8yTp1/u511wiXrU85p+L8Gn8n65liDr2X9wxr8VtZH5xo0yfpprYFT
1tfMGlwg6292DR6V9Tm3BlGq3zVYKOu7owY3yfqPQlv64KzR+Vfnr9H5V+ev
Yf+zNex/rkbnX51/LYqlb461+E76h7U6/+r8a3X+1fnX6vyr86/V+VfnX6vz
qc6/1vC7Fl9I3x21Ov/q/Mbnzlq8LPtbtXz8TC2SdP5anX91/lrD/zqdf3X+
OmP8dThUXh9nnc6/On8dZsnrm6nT+Vfnr9P5V+ev4/krquf7O0c9HqT5r0eN
XB/OeozK9WPV4w9yfWXqcQ2tv3o0yfWZq0eA/G/AU3J9OxpwgNZ/A6YlRT6c
DThd5sdqQEDmK9OAGul/tgHzZT5zDYb/jXhe+u9oROSTnm93bnvL9h+N7L+z
Ef+Q/luN+KmsL5lGHCzrT7YRLbI+5Rrx8QxZv5p0/lX9acInsv6hif13NmG1
rJ9WE1bJ+ppp0vf/6vxNOv/q/E24ler3OiyX9d2xDutl/cc6JKQPznWokX5Y
hbb0JbMOL0t/suswU/qUW4e3ya9mzJC+OZr1+lfnb8ak9NHZzP5bzbhD+ppp
1vf/6vzN7HOu2fC7BV9K3x0t7D+Mz50tOv/q/C18/EwL+59tYf9zLTiB/G/F
Fjk+R6sx/lYcIa+PsxXvyetnteJ4eX0zrex/thX1cn5yragj/9swKufX0YaH
af7b0CjXh7MN98v1Y7Xp+391/jYsp/XXpvOvzt8GD/nfjmfl+na0Yz+t/3YU
J0U+nO2YKf232nG3zFemHc2Uv3bcJ/OZa8f55L8L/9gq8l3iQuzAL0Pd86Zs
/x0u7Jf1odyFKek/XGiV9aXKhbNk/XG6EJL1yeXC9hmyfrnY/1EXPpL1L+PC
I7I+jrv0/b+qby6skPV10oXLZP3NuTAu63PehZvJ/w6slPW9pAN3y/rv6EBc
+lDegWXSD3RgufSlqkPf/6vxd6BE+uTq0PlX4+9g30Y7sEf6l+nAK9LH8Q6U
Sj+zHbz/n+zg/X+ug33Od7DfRZ0632r8nThX+u8wPi/vxITsj068II9f1cn+
Oztxt/x+rk7j/qWT729GO9n/TKfOvxp/J6bk9csWjiev72Qn7/9znXDK+cl3
6vyr8Xfp/Kvxd2Gc5r8Lbrk+yrvwoFw/6MLzcn1VdWGlXH/OLvbf1YV+un/t
wma5vke7UPSZXP9dOEz6P96FY6X/2S6dfzX+LnTJ/OW68IHMZ74LleR/N6Zt
E/ku6Ub82IOOPvDwX23/Hd06/3Z9KO/GD2X9QDfaZH2p6sbZsv44u+GT9cnV
jb9J/61u9n+0G3lZ/zLdOv92e7yb9//ZbiyT9XWyG3Nl/c116/zb7Xw37iT/
3Vgl63uJG/fI+u9wIyZ9KHfr/Kvxu3X+1fjdvP93unGk9MnlZv8tt86/Gr8b
u6V/GTc2Sx/H3Tr/avxunX81fjfv/3Nu9jnv1vlV4+9h30t6cJ7032F8Xt7D
/dGDTfL4VT1IyfM7e3T+1fh7jPuXHn6+MdrDzz8yPThcXp/xHp1/Nf4enX81
/h6dfzX+HqyR85PvMfzvZf9LenX+1fh70SvXR3mvzr8afy+ycn1V9WK1XH/O
Xvbf1YtBun/txatyfY/26vyr8fdipvR/vBfHS/+zvez/ZOH4Mn+5XuyQ+cz3
6vyr8Xvw023Sfw8uP+7DN16M55T/Huwj/z04QP57UEf+ewz/PRgm/z2YIv89
+Jz8L7TJf4++/1f1z2P470E1+e/BpeS/x/Dfg1+T/336/l/Vvz7cS/W/D1Hy
vw/V5H+f4X8f/kT+9+n8q/H3Gf73YTr534c8+den86/G32f434fbyP8+3v/n
+tjnfB/7XdSPr8j/fp1/NX7j8/J+w/9+nX81/n6dfzX+fsP/fsP/fn7+P9rP
7z8y/Tr/avz92Eb+9+vnf2r8/Yb//Xp/psbfbzz/HzD8H8DjNP8D6Cf/Bwz/
B7CJ/B9ADfk/gEbyfwDD5P8AXif/Bwz/B3As+T+Ak8j/AcP/AQTJ/wHsJv8H
cCX5P4iryP9BTPzmsvWR7Hbl/6Dh/yC+kvt/DGIF+T+o86/q3yD6yf9BvE3+
Dxr+D2IX+T+IB8j/QcP/QSwh/wcB8n/Q8H8Qd5D/Q7iB/B/S+Vf1fwgR8n8I
S8n/IcP/IZ1/Nf4hHEH+Dxn+D+nnf2r8Qzr/avxDhv9DOI78H8IG8n+I99+5
IfY5P2T4P6zzrcY/bPg/jK/J/2G8Qv4P40Xyf9jwfxj3kv/Dhv/D+Dv5P4z9
NP5hHEb+D2Mr+T+Mo8j/Yb7/yg1jLfk/jAbyf8TwfwRP0PyPYJD8HzH8H8GH
5P8Iasn/EZ1/Nf4RnX81/hHe/4+O4Bta/yM4nvwf0e//1PhHDP9HkCT/R/Ad
+T+i86/Gb6HtryLfxRYqfz624tqvPrL9L7HY/1ILu6T/DgsLZX0ps/T9v6qX
FtyyPlVYmJT+w+L9f6WFzdL/Kgtjsj5WW+y/09L5t9uNFipk/XVZeEvWZ4+F
2+j5rYWlsr5HLKRk/R+1+Pn/BkvnX9Vni/0fs/Cg9GfcwrHSp6ct9j9r4WDp
24Sl33+pem6xj1OWzr+q7xZukb7usJCW/uYt9n+vZfjv5f19sZf9L/Hq/Kv5
92Kz7O/w8vOFMi/7X+7l5xMVXv38T82/l/f/lV5+/1/lxb/J61PtxXZ5/Zxe
nCivb6MXz8jr7/JiUM6Px4tV9P7Gy/5HvDr/av69GJbrY4MXCbl+Ml68KtfX
mBeNcv2NF8Yv1+fTXvjo/tWLLXJ9T3jxv3L9T3rxY+n/lFe//1Pz72X/d3gx
40SRv7xXP59X8+/FmeS/DzdK/4t9qF0RnDn91n22/yU+7JP7g9LC59J/hw+v
vivqS5kP47L+lPt0/u12hQ/fSf/hw/PS/0ofv/+s8uFeWR+rfVgk66fThzZZ
Xxt9+v2fqrc+TMr67PFhNT2/9aFV1veIj/0f9bH/G3zsf8aHRunLmA8bpT/j
PsyQPj3twxbyy4cfSt8mfPhc+jfpw9vSxykfDpN+5nz4L+nrDh/7n/fx/n+v
T+dX1X8/+17sR4X0v8T4vNTP/R1+/Ekev8yPm+X5y/38/L/Cjxny+8OPD+T4
Kv04arcYf5Wfr0+1H6/L6+f069//qPn344/y+rv8/Pzf48c6en/jx31yfiN+
/fxXzb9f51/Nv1/nX82/H0XbxPoa86NFrr9xP/v/tB9Bun/143a5vif8+Fau
/0k/TpP+TxWOL/3P+bFe5muHH3fJ/OUL13tK5HOv39j/B3T+1fwHUCT/lAQw
V77/Lw3w80NHABXkfwCvyff/5QGcSf4HcIisXwjg57K+VQbwEvkfQCP5H0CE
/A+ghfwP8Pt/VwBvkv8B/v2WFcAC8j8AN9X/wt8n/wNYTP4H0Ez+B/AA+R/A
NPI/wL9fywb0/a2q/wEctFv6HzD8D+Ao8j+Am8j/AALkfwBPkf8B/JH8D2In
+R/EGeR/EP8k/4PIkv9BPn5ZEH7yP6j3J2r+g/z+H0G8Sv4H+f6nKojjyf8g
PiL/gziJ/A8a/gcxTP4H0U7+B5Em/4P8+7/RoL7/V/MfRIr8D+Iv5H9Q51/N
fxB3kf9BhMj/IN4l/4OG/0H8jPwvfH/yP2j4H8Qj8v47H8TJ5H8QvyD/Q9hP
/oeQObV1/v7nHlP3/yFcKt//l4awgPwPYQ75HzL8D+Fe8j+E78n/EJ4h/0OG
/4XvQ/6HUEX+h/j3VY0hff+v6n/I8D+EFeR/CFeT/yH8lup/CLeQ/yH9/E/V
/5DhfwhZ8j+EQ8n/kP79r6r/IRxC/oewi/wP4R3yv3A88j+EMPkf0u/fVP0P
Gf6H8Cr5H8Y35H/Y8N/4vDTM/R1h/Jn8D+MW8j/Mz/8rwvz9EUaO/A/jGPI/
jGnkf9jwP8zP/xvDfP/lChv+h9FC/ocxRv6HjfkPw0/+h/n3o5nC9yP/w3CR
/2HD/7D+/Y+a/zDuJP/DOv9q/sOG/2G4yf9wwXvpf5jzlw/jRPI/bPgf0flX
8x9BkfxTEoGD/I/w80NHhPcXZRE8R/5HMJv8L5yP9v8Rw/8INpH/EdSS/xHD
/4jhf8TY/0fwGvkfMfyPYD75H0EH1f8I+7AhgoXkf+H85H8EY+R/BD8g/yP8
+7VsxPC/cP3J/wjvj6ciOIb8j2CU/I+wv/kIniT/C/ND/kexg/yP4jTyP8r3
B6VRbCT/o3z8sqjhf9TwP2r4HzX2/1Eef1UUPyL/o/iY/I/CQf5HDf+jsMj/
KDrI/6jhfxR30fxHMUT+R3n9ZKK8vsaiaCP/o7iH/I8iRv5HsY38jxr+R3EW
+R9FL/kfNfyP4inyP2rs/6PG+/8YTnpf+h9DfddVd9504Hu1/49xfSiNAeR/
DGXkfwyPkf8xrk8VMewj/2N4nPyPcf2rinF9rI7hGvK/8H3J/xjOIf9j+v5f
1f8Yqsn/GK4g/2NG/Y/p53+q/scM/2Psy1jM2P/HMJ38j7Ff2Rj7NhHDP8n/
GN4l/wvHI/9jCJH/MX7+no/x8/+9McP/OPaS/3HMIf+Nz0vjhv9xvET+x7Ge
/I/jHvI/zt8fcWwn/+M4lvyPG/7H+f7JGTf8j/P9lyvO92eeuOF/HPeT/4U2
zX8cYfI/bvgfRzH5H0c3+R83/I8jSv7H+f52Is73v5NxnX81/3H0kf9xvr/e
Eccm8j+OM8n/uOF/Aie/L/1PYM43Dac+e/sL6v4/gf3vSv8TvH9wJHh/UZbA
E+R/AieS/wl8Sf4ncCb5n8Dz5H8Cq8n/hOF/gt+vNha+H/mf4P2ZJ8H7NyuB
a8n/BFxU/xNIkv8JXE/+Jwz/E7iP/E/gYPI/Yfif0L//VfU/YTz/T/D+eCph
7P8Thv8Jw/+Esf9PGPv/JD4l/5PG/j9p7P+Txv4/aez/k/z8oTzJv0+oSBr+
J/n5RmWSn39UJQ3/k/iE/E/iFPI/iT+Q/0l4yf8kOsn/JFLkf5J//zla6E/+
Jw3/k/x8aSyJDvK/cDzyv3A+8j+Jv5P/ScP/JOaQ/0lY5H/S8D+JCfI/yc/n
9iYN/1OoI/9TOv/K/5TOv6r/KfwH+Z9CKfmfMvxP8fPJihT2kP8pw/8UP/+s
SvHz0eqU4X8Ka8j/FMrJ/xS2kP8pLCL/U5hL/qdwH9X/lH7+p+p/CkvI/5Th
f4qfP4+nUEz+pwz/U/r9n6r/Kewk/1OG/4Xjkf8pBMn/lOF/yvC/cH7yP41v
yf+04b/xeWma+zvSmCD/04b/aX7/X5E2/E/jQ/I/jePI/7Thf5rfnzjT+t//
qPlPG/v/NP/7P08abeR/2tj/p/EQzX8aMfK/0Cb/0zic/E/DQ/6n0UD+p5Ek
/9P8fmsibfifxgXkfxpe8j+Ne8j/NN4m/9MA+Z82/B9FRPo/bRQXnbrnotdb
Nz/3f4vo5gg=
           "]]}}, {}},
       AspectRatio->NCache[
         Rational[1, 5], 0.2],
       Axes->{True, True},
       AxesLabel->{None, None},
       AxesOrigin->{0, 0},
       DisplayFunction->Identity,
       Frame->{{False, False}, {False, False}},
       FrameLabel->{{None, None}, {None, None}},
       FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
       GridLines->{None, None},
       GridLinesStyle->Directive[
         GrayLevel[0.5, 0.4]],
       ImageSize->720,
       Method->{},
       PlotLabel->FormBox["\"Window Length = 181\"", TraditionalForm],
       PlotRange->{{0., 1025.}, {-1.4275550934302843`, 1.4275550934302834`}},
       PlotRangeClipping->True,
       PlotRangePadding->{{
          Scaled[0.02], 
          Scaled[0.02]}, {
          Scaled[0.05], 
          Scaled[0.05]}},
       Ticks->{Automatic, Automatic}]},
     {
      GraphicsBox[{{}, {{}, {}, 
         {GrayLevel[0], PointSize[0.006944444444444445], Thickness[Tiny], 
          LineBox[CompressedData["
1:eJxd2nl8lNW5B3Da0oq21nhdCO31dnArWsWoqGERfoBgFNAoAgFZhoSEQFgm
+2R/Z99ncq33SluFERXBBSKiRot1rveqqQvEBUhQcACBiFuslmLr59q5vud8
7vM7/MPnvJMz73ve8zzP933PmZGla+8s/+GQIUN+MHTIkP/73/43OOm0hede
e+mmp3aqA+jbd+aX5b/aMsluDsMPd1y2c9Pw51U7D5OWJtfk9bys2ufijE0r
JnSf6lHtfJy7ZGTLNyN2q/a/4rv1e0b/5N53VNuB9371eP3vU3tU+0JUbNm6
6XBbn2pfjMzCQ6fnLXpftS/F2JM/KVz0m4OqPQqffHfh70K1WdW+HK9Ubh07
/rVDqn0FClyHvv3bWUdUezT2XnD6JV/N/Ei1C7Dh0/iYFW1HVftqvDG+o2J9
+phqX4Mntq288MNnjqv2tbhx+HlV1s4B1R6DyaGvbs4+/bFqX4eHHvz5ZRV/
OKHa1+PGNSOm+Wo+Ue0bsO1F68vthZ+qdiGqX5vwdfNnuj0WNyWu2V3V+Zlq
j8PR4MmhI0d+rtrjsf/KV+dO3qDbE7C34J5/tJ/xhWrfiG0L/7b7vlLdnojz
HxnWMedR3Z6ESy95+6FEn24D7aubjow8qdoWYB8fVJ9PNj6fbPSfgnz5/dYU
bKfzT8V+eX3WVPTT9d+Ej+T4rJswncY/DbXy/ljTsJ3u33RMkvfXmo5NdP9v
xjQ5P9bNmE7zV4Rn5PxaRXiP5v8WPCDjw7oFeyh+bsUYGV/Wrfgzxd8MDMr4
tGZgCsXvTLwu49uaCRfF/yx8JvPDmoURG2T+3IYzZH5Zt2EI5d/tuE7mp3U7
RlP+FuPqPpHfKMYZ0fUzxza9MMH++2K8Zuf/S9+3M8X45unv+9vtIXfgl/b3
223cgWOPfH9+u23dgcHF31+f6n8HzrSvX/W/E4fs8an+d2KZPX7V/078yb4/
qv+duMG+f6r/bJyw76/qPxv/Y99/1X82rrLnR/WfjV57/lT/u7DOnl/V/y70
2vOv+t+Fp+z4UP3vwhQ7flT/OTr/Vf852GjHn+o/BxPs+FT95+j8V/3nwmXH
t+o/F1Pt+Ff95+KwnR+q/1zss/NH9Z+HPju/VP95eMrOP9V/Hobb+an6z9P5
q/qX6PxW/UtgHx9U/Y3PMyVG//k6/1X/+Tr/Vf/5Ov9V//k6/1X/BTr/Vf8F
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
kv9tev9P1f82PEj+t+n9PzX+NlxL/rdhPfnfhgLyvw2Pk/9tvL7d2abzX42/
Tee/Gn8b9pD/bXr/T42/Tee/Gn+b4X+bzn81/na0kf/tsI9r/9sN/9sN/9sN
/9sN/9vxAfnfbvjfjk/J/3bcQuNv1/mvxt+u81+Nv12vr6rxt+Mx8r9dr8+q
8bdjBvnfodd31fg7sJ/mvwMPkf8dOE7+d2A8+d+BA+R/B06S/x0YQ/53oI/8
78BSiv8OfEv+d+B08r8DFeR/B/6N/O/Ab8n/Dqwi/y08If0fZqn1v722/3kW
Zkj/8y3slP47LEyQ9WWUhR7pf4GFs2V9KrTwofQfFt6R9a3IQqGsf8VWLp5E
fSyxcKasn04LR2R9rcz9vay/LgtTZX12W8b6rYV7ZH0PW9gh63+npfeH7PY6
i/f/0xaukb5sthCX/nRZvD7dben8V/XbQoX0rcfCLOlfr8X7432Wzn9V3y3s
kr4OWLz+Pmix/6csw38PWqXvwzywjyv/8zzokJ/ne3CZ7O/w4Fz5/aM8ev9R
zb9H57+afw+OyuuHh/c3ijw6/9X8e9Au70+JB6/I++f06P1VNf8ePC7vv8uD
2XJ+3B7cQPs3Hr2/q+bfo/Nfzb8Hf5Txsc7D+0fp3PllfG324KCMvy4Pzhly
0f/HZ7cH19Pza+58Mr57PFgv47/Xg5dlfvR58FPpf9aDlTK/BjxIS/8HPRgh
8/OUB3XkvxcvSv+HebHxu+TIC84+afuf58VY6X++F09L/x1ePO8U9WWUF5Nl
/Snw4meyPhV6cUD6Dy/ulfWtyItqWf+Kvdgq62OJFz+V9dPpxf/K+lrp5f1X
lxejZH12e7GT1m+92CLre9iLP8v63+lFWvqwLvd90o+0l/eXN3vxgPSny4ur
pE/dXrxAfnn171vsdo8XkP71etEvfezz4qD0M+tl/we87P+gF2dLn095jf17
H/s/zAf7uPI/z/g838f9HT72f5QPz8nzF/jwnry+Qh8+kNcPHz6T4yvyYa4c
f7FP/z5Kzb8Pz8r75/Rhlry/lT78Tt5/l49/n+H2YSbt3/jwmpzfsA+v0Pz7
8LCMj3U+fCzjJ527Xhlfm338+5MuH07J+Oz2wUXPrz5slPHd40O5jP/e3Hw4
RH70+TBD+p/14Su5vzbgw69l/g36cL/0/5QPrc9I//3YLff3hvnV+v9+5b8f
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

           "]]}, 
         {GrayLevel[0], PointSize[0.006944444444444445], Thickness[0.01], 
          Opacity[0.5], LineBox[CompressedData["
1:eJxd2XtsZOdZBvDTsqVOaMoEQuqQhkzSmykoTElLnRCap4W0zq2ZvYS6zV6O
N6x3vDT22Z3xenZndv3N/cx9RCthVSg5rZqto0KZqBe5JSiHIMqoAjq0bOoN
pDmbCmpFCE2EVDnwR1mYCfqeJ/9EvzizXp/vfZ/nnONbjq7sO/ZGx3HesMdx
/vff439Gd7/54HW3v/vC5++a/AeM/fQzY07hb39wzavHbn7q2bFjeIV8HW7e
tj2N1776q89ceNs3J3473vU123H8GvlW3LjQWY4Nnpv4nXg/+d3YS57Bvz25
dNfW7mDi9+KtF2z/Om4k34bR4Vtyr93w3YkTmD5i+314F/k38YYnLt72s5/9
3sS3Y4r8flxD/gD+5eYvr36ue3Hi38IPyR8Uz4rvEN8p/m3xXeLfEX9IfLcY
bCN2PixfFzsfka+Lnd+Vr4ud35Ovi5175Oti56Py9Y/K9f8YbrTPx3xMzmuO
z9PMyfnfi7faNvfK/NzH82Xuwx6at/t5Ps39Mr8P4E7b5gGZ/wfxQXs/zIOy
Px/n/TIfx0do/x7ifTQPyf4mJ/v9V+P9RpL33SRxdePxB+44861xHoRJfH38
+bvHn9+LbdvYi/dtWzZ78er47zd2uBdv/JplZx9us419eNv45598fh8+YDvc
h7ttO/vx8vj6Tj6/H84Fy2Y/rrYd7se/j89v8vkDuPqIZRzAdbbNAfz08f+b
j8nnr/z/T1h2HsYNtvEw/mk8f5PPP4yXbIdi5/fZEBtxKHY+IZ8XG3Eodubl
82IjDsXOJ+XzYiMOxc6n5PNiIw7FziPyebF5BDfZ5xM+wuflHOTzxEH8Ip3/
QZ6P8KDMzyFcZc8XDsn8HeL5DA/hQzS/h3m+cVjm/zBg70d4mPfFOcL7hSM4
QPt3hPcxPCL76+Kq9KVn//znvz3e77jL+w6X88F18UU7P4zLeRK4nD+hix07
nyJX7gcWON/iC/gFO/+wwHnoLkheLuBFO1+DBc7bcIHzOFrADuX3Uc7z+FHO
exzFK49b/eAe5f4wR7lfgqN40e6f8Cgu247EzqPsuBhiV2zEgTgUR2LnD+T7
iyF2xUYciENxJHaOyfcXQ+yKjTg4Jtf/GJ9PdEzu5xb5fOOLeJjOf5HnwV3k
+TGLuMaer2CR5y1c5PmMFlGkfj/O8xw/LvN/HHP2frjH5X7gOO9XcBzHLtn7
d5z3MTrO++ukJvv+nfF+x1NyP5DifHBTnB8mxXkTpPBHlDcpvGTnU5TivHKW
ON/iS5x/WOK8dJfwIOXjEi7Z+RosSd4ucT5HS5LfJzjv4ydwK90PnMCO3f/u
Ce4Lc4L7JTiBf6a+OsF9FImdP2THxRC7YiMOxKE4Ejuflu8vhtgVG3EgDsWR
2HlMvr8YYldsxMFjcv0f4/OJHsPPUP8v8/nGl/FJOv9lngd3We4PlnGtPV/B
Ms9buMzzGS2jSv2/wvMcX+F5xwr22vvhrvC+mBXer2AFa5fs/VvhfYxWeF8d
D2/5/KOXnnv5H8b7HfPkfsDjfEh4nB/wYOx8SXqcP66H5+188jzOK+NxvvU8
zr/Aw722+x7nZ+jhop2vQ0/y1uN8HnnS/ydxk53vsZOc//GT+Fe7HxInuS9w
kvskeRKXqK9Och95YiPuiQNxXxyKh+JIPBI7p9gxcVycEEOcFLtiT2zEPXEg
7otD8fAUX//oFN5kn8/olPR/ms83lsZhOv80z0MizfOCNK635yuZ5nlz0zyf
XhoNun9N8zz30jzvQRqfsvejn+Z9CdO8X8M0fHv/ojTv4yjN++pkJn3/j+P9
jmXkfiDD+ZDIYNnOD2Q4X5IZzh83g7+388nLcF6ZDOdbL4N77PwLMpyP/Qzn
Z5jB0M7XYUbyNsP5PMrgBju/nVXO99gq5398FT+y+yGxyn2BVe6T5Cp+QH21
yn3kiY24Jw7EfXEoHooj8UjsnGbHxHFxQgxxUuyKPbER98SBuC8OxcPTfP2j
03izfT6j09L/a3y+sTUcpfNf43lIrPH8YA2/bM9Xco3nzV3j+fTW0KX71zWe
596azP8aHrX3o7/G+xKu8X4N1/A5e/+iNd7H0Rrvr5OF/+PTr73ywvcn/Z/l
fY9nOR8SWRyy8wNZ6f8s54+bxd9Q/2c5r0yW862XBSj/stL/Wc7PMIu/o/7P
ct5GWc7nURa/RO93z0j/n5H8P4PL1P9nuC9whvsleeb193+Tn/8M95EnNuKe
OBD3xaF4KI7EI7Fzlh0Tx8UJMcRJsSv2xEbcEwfivjgUD8/y9Y/O4irq/7N8
Xk6OzzeWwyKdf47nIZHj+UEOv0L9n+N5c3M8n14On6H+z/E893Iy/zl8mvo/
x/sS5ni/hjn8KfV/jvdxlOP9dfKT+/3nJ/2f532P5zkfEnncT/2f5zxJ5jl/
3Dyeof7Pc16ZPOdbL4+7KP/ynIf9POdnmMeA+j/PeRvlOZ9HeVxL/X+O8zx2
TvL/HF6i/j/HfYFz3C/Jc/ge9Z/YExtxTxyI++JQPBRH4pHYOc+OiePihBji
pNgVe2Ij7okDcV8ciofn8Rz9/Ofxc9T/5/m8nHU+39g6TtD5r/M8JNZ5frCO
gPp/nefNXef59Nal/9d53nvruIHmfx0Z6v913pdwnfdruI6/pP5f530crfP+
OgZf+Gnnlpuu/cl4v6eM3A8Yzodpgzvs/IgbzpMZw/mTMPiqnU+zhvMKhvNt
zuCbrpV/ScN5OG84P13D+ZoynMeewYdtZw3eQr/PNZznvuH87xm8aPfDhuG+
CAz3y6bBZ6mvDPfRljgUD8RD8bY4Eu+IR+JdsVNgT4lj4mlxXDwjTohnxRDP
iZPiebErThX4+nsF3G+fT7bA52UKfL5+Qc6/wPOyUcB/2u+PggLP12YB77Hd
L/A8bhXwJ3T/WuB5HhR4/ocF5L9u7cd2gfclKvB+7RR4/0YF3tfdAr5L7/+L
k+f9F8b7PVWU+4Ei58N0ETPPW/kRL3KezBQ5fxJFzqfZIucZinjK9lyR8y9Z
xO2254ucl24Rz9r5mipK3hY5n7NFtOz3/6bIee4XOf97Re6HjSL3SVDEtO3N
IvdPv4hv294Sh+KBeCjeFkfiHfFIvCt2SuwpcUw8LY6LZ8QJ8awY4jlxUjwv
dsWpEl9/r8Tnky0hRr+/KfF5+iWk6fxLPA8bJZ6foISn7PnaLPG89Us8n1sl
nuewhFttD0o8/8MS78d2CVXbUYn3aaeEy9T3Jd7H3RLvr1OW/i9zHsTKuHN1
/SfOU5cn/V/m/IiXcT31f5nzJnHlz6f+L3Neocz5NldGn/q/zHk4X+b8dMuc
t6kyZqn/y9L/Zc5vU8Ye6v8y532vjEvU/2Xui6DM/bJZRo/6v8x9tCUOxQPx
ULwtjsQ74pF4V+xU2FPimHhaHBfPiBPiWTHEc+KkeF7silMVvv5eBQ9R/1f4
vEyFz9ev8Dz0Kvhve142KtL/FZ63zQp+g/q/wvO5VcGT1P8VnudBhed/WEGb
+r/C+xJVeL92KryPoyt/X3tfdyvS/1Xe76nq5P3fDyf7X+U8mK7iTdT/Vc6T
mSrnT6LKeTVbxQb1f1X6v8p5mKzivdT/Vc5Pt4pvUP9XOW+9KudztooS9X+V
89yvSv5XuS82qriO+r8q/V/lPupX8R3qf3EoHoiH4m1xJN4Rj8S7YqfGnhLH
xNPiuHhGnBDPiiGeEyfF82JXnKrx9fdqfF5Zsanx+fo15On8azwPGzWen6CG
p6n/azxv/RrP51aN5zkUD2o8/8Ma78t2DX9M/V/j/dqpYc8Ldv/XeB93a7y/
jo93NF/98eV7dif978v++9L/PudJXDzjc/4kfPSo/33OK/icb3M+vkT973Me
zvucn67PeZvykaD+9zmfsz7nuRH7vuS/j4vU/z73ReBzv2z6aFH/+9xHW+JQ
PBAPxdviSLwjHol3xU6dPSWOiafFcfGMOCGeFUM8J06K58WuOFXn6+/VsZ/6
v87nZep8vn5dzr8u/S8O6tL/dZ6/fp3nc6uOP6P+r/M8D+o8/8M6nqD+r/O+
RHXer5269H9d+l/sNCbv+1/v/4bsf4PzYbqBly/a/d/gPJlpcP4kGtL/Dc4v
NDjf5hrS/w3pf7HbwFeo/xuct16D8znbQI76v8F57jck/xvS/w3pf/FmQ/q/
If0vDsUD8VC8LY7EO+KReFfsNKX/xTHxtDgunhEnxLNiiOfESfG82BWnmtL/
TXn+b0r/N6X/myjT+Td5HjaaPD9BE9+i/m/yvPWbPJ9bTXn+b0r/N6X/m/L8
35T+b0r/N/Ee6v8m7+Nuk/fXaUn/t3Dymcz3/+P868//Lc6H6RaG1P8t6f+W
9H8L56n/W5xXaHG+zV0x9X+L83C+xfnptuT5vyX935L+b8nzf0v6vyX5f+Xn
pf5vcV8ELe6XzRZ86v8W99GWOBQPxEPxtjgS74hH4l2x02ZPiWPiaXFcPCNO
iGfFEM+Jk+J5sStOtfn6e218gvq/zedl2ny+flve/7R5Hjba8vzflvf/bZ63
flue/9v4BvV/m+d50Ob5H7bxNPV/m/clavN+7bT5/duozfu42+b9dTqT3/f9
aNL/Hd73WIfzYLqDZ6n/O5wnMx3On0SH30/Odjiv0JHn/468/+9wHs535Pm/
gyep/zuct16H8znbwSnq/w7nud+R/O/w++GNDvdF0JHn/468/+/I+39xKB6I
h+JtcSTeEY/Eu2KnK+//xTHxtDgunhEnxLNiiOfESfG82BWnuvL+v4u3U/93
+bxMV97/d9Gm8+/yPGx0eX6CLv6a+r/L89bv8nxudfn3V2GX53nQlff/XfwF
9X+X9yXqyvv/Lu6j/u/yPu52eX+dHr54/YGvXDj7X+P+39P7/33/H4jzmt8=

           "]]}, 
         {RGBColor[1, 0, 0], PointSize[0.006944444444444445], 
          AbsoluteThickness[1.6], LineBox[CompressedData["
1:eJxd23l0W9WdB3CXpnNCQ4sphZo2FLWnBE8pjAc6Q6AsXwgEE5Lg7CZxEsWr
vEu2ZMub/LTvktkyAQqoQBmzO6wpMKBmZsCTshhowYS2iEAhcKA1AUpKMjCa
vnvP+X1v/uHcKFdP9937/X3uuxI/aOxd3XJERUXFV+ZVVPz/f+0/cxd8PXXz
8rOHHntC/QUOvfqNj1pOuvMCuzkfH19Rv/eel3erdiXOefXF9987+n9U+9v4
1sJ7d12FF1S7ComFN3a989LvVHsh5h9V+sNfXptVbQfeyDz8o8jvXlftH+Lz
Dz7v+XSupNo/wr1Lr3VknPtUexE8x/77ow8885ZqV6O5/bzJh3e+o9o/Ru1L
07XtX9uv2j/Bo68dWrBo5XuqfTqu9r0Y9hz7gWrXoOXidde8u+RD1f5nXHvN
pf+9sO3Pqn0Gtj/1/sKPxudU+0w4P77g1xd+9SPV/imaT73//o8Cuv0vmK46
sPP6nQdU+19x/PhnF1Sf+LFqn4UXFp16PCzdXoypU5PfuX2vbp+NG745L7rw
J5+o9jnoWPDOSYNe3f4Z3v7jc7XxB3X7XDSWzvzeovd0+zxcMdAaPeO4T1X7
fIS++5eGq87S7QuQ2rim97Q63QYeCZyS/2yLalvAwWc6bnqnSb9+ofH6hUb/
ixCR729dhDq6/hI0y89nLTE+/8U8PutiY/yXYKe8P9YlmKH7txTfkffXWoo9
dP8vRbucH+tStNL81eLncn6tWtxE838ZnHJ9WJfhKlo/y/C4XF/WMiyj9Xc5
OuT6tC6Hj9bvcjwk17e1HF/S+l+BQzIf1gr8kPKzEmGZL2slKil/V+A8mU/r
ChxZJ/NbB/+syDfqML//tafuP/rpc+1/X4fDdv6f+nu7WIf37fzb7YpVOMZ+
f7uNVTjwvb9f325bq+C1P5/qvwrftD+/6r8aH9jjU/1X46A9ftV/Ne6x74/q
vxqd9v1T/deg0b6/qv8aXGzff9V/DR6w50f1X4O0PX+q/1pstOdX9V+L6+z5
V/3XYoe9PlT/tWi214/qvw5t9vpS/dfhaXv9qf7rdP5V/3U6/6r/ep1/1X89
rrfXv+q/Hu12PlT/9XjLzo/qv0HnS/XfoPOn+m9A2M6n6r8BaTu/qn89HrXz
rfrX6/yr/sbrxXqj/5U6/6r/lVhF178SLfLzFa/U+Vf9N+r8q/4bcSONfyMe
kPenuBEv0v3bhCp5f7EJv6H7vwkdcn6Km9BO89eAm+X8ogE30Pw36Pyr/g06
/6r/Zu2L6r9Z51/136zzr/pvRh+t3y14UK5vbNH5V/3LbZmP4hYsovxs1flX
/bfihIUyf1uxVOazuFXnX/V34oZZkW+HE0f9oum13fuet/2HU+ffrg9OJ/ZJ
/y0njpT1peDU+bfbRSfcsj6VnIb/2/ChrG+ObfirrH/Yhl/K+ujchnZZP61t
cMr6WtiGc2X9LW7D/bI+l7YhSfW7EWtkfXc04mpZ/1FuSx+cjTr/6vqNOv/q
+o3sf7GR/S81Gv43sf+OJvYPTTr/6vpN7KfVxL4WmtjfYhP7XGrS+VXXb9b5
VtdvZv9hvO5s5v5WM79/oVnnX12/WedfXb8ZfyL/W9Apx+dowc9p/C06/+r6
LXhJ3j+rRedfXb9F519dv0XnX12/heevopX3d45W3E3z34pGuT6crZiQ68dq
xa/k+iq0Yjmtv1a0y/VZakWE/G/DI3J9O9rwBa3/NszLinw423CqzI/VhojM
V6ENjdL/YhtWynyW2gz/XXhS+u9wIfHuwN/e3/uy7T9c7L/ThTel/5YLp8j6
UnDhCFl/ii50yfpUcuGdBbJ+tev8q/rTjndl/UM7++9sx1ZZP612bJH1tdCu
9//q+u06/+r67biO6ncHNsn67ujAdln/0YGM9MHZgUbph1VuS18KHXhG+lPs
wDHSp1KH4X8nHpS+OTrZf3TqfKjrd7L/Vif7X+jESulvsZP9L3Xq/bu6fhf7
7uhi/2G87uzi/lYX+1/o0s8f6vpd7H+pS+dfXb8b3XJ8jm72H914WN4fZzf7
b3Xj2/L+FrrZ/2I3WuX8lLrRQv73YELOr6MH99L898Al14ezB3fK9WP16P2/
un4PNtH669H5V9fvgZ/878Xjcn07enGY1n8v5mdFPpy9OEb6b/XiVpmvQi86
KX+9uEPms9SLs8l/N958TeS70o3UFz+LeS+etf13uHFY1ocaN2al/3CjW9aX
OjfOkPXH6UZM1ie3G/sWyPrlZv8n3Hhb1r+CG/fJ+jjl1vt/Vd/caJD1dcaN
S2T9LbkxJevznBvXkP8ebJb1vdKDW2X9d3iQlj7UeLBR+gEPNklf6jx6/6/G
70Gl9MntwfPkl4d9m/Bgh/Sv4OHn4ykP9kk/ix40SV9nPDr/avwefv6f8yBJ
/vfx831lHz6T/juM12v6+Pkffbq+qPH38fmDs4/9d/cZ+5c+nX81/j6dfzX+
Pp1/Nf4+nX81/j6dfzX+Pn7+L/XBKednrk/nX42/X+dfjb8fUzT//fDJ9VHT
j7vl+kE/npTrq64fm+X6c/az/+5+DNP+tR975Pqe6EfFh3L99+Mo6f9UP46T
/hf7df7V+PvRL/NX6scbMp9z/agl/72Yt1fku9KL9HFfOfaLe39v++/w6vzb
9aHGi3+Q9QNe9Mj6UufFmbL+OL0Iyfrk9uIP0n/Ly/5PeDEn61/Bq/Nvt6e8
/Pxf9GKjrK8zXiyR9bfk1fm323Ne3Ez++7BF1vdKH26T9d/hQ0r6UOPT+Vfj
9+n8q/H7+Pnf6cPR0ie3D8+RXz59vqXG79P5V+P38fPxlE/nX43fp8//1Ph9
WCH9Lfl0/tX4fTr/avwDOt9q/AM6/2r8xus1A9wfA7y/qBtg/50DvD9xD/Dz
vzWALjm+iQH2vzDA/k8NsP/FAfZ/ZkDnX41/ANvk/MwNGP4Psv+Vgzr/avyD
GJTro2ZQ51+NfxBFub7qBrFVrj/nIPvvHsQo7V8H8axc3xODOv9q/IM4Rvo/
NYgTpP/FQfZ/pvz+Mn+lQeyX+Zwb1PlX4/fjlL3Sfz+WHv/WC/+ZLin//ThE
/vvxBfnvRwv57zf89yNA/vsxS/778Wfyv9wm//16/6/qn9/w34968t+Pi8h/
v+G/HzeR/0N6/6/q3xBup/o/hCT5P4R68n/I8H8I/0X+D+n8q/EP4Vnyf4jP
tyeG8G/k3xA//08N4U3yf4jP/2eGsJz8H0KQ/B9CgvwfxsPk/zD+Sv4br9cM
8/4Bw4b/w7z/cA7z+YR72PB/WOdfjX+Yzz8Kw4b/w4b/wziW/B82/B/Wz2dq
/MPG+f+I4f8IHqD5H8Ew+T9i+D+C3eT/CBrJ/xG4yP8RBMj/ETxP/o8Y/o/g
OPJ/BN8n/0cM/0cQJf9H8BH5P4LLyP9RLCP/RzH9i0u2J4r7lP+jhv+j+FQ+
/2MUDeT/qM6/qn+jGCb/R/Fb8n/U8H8UH5D/o7iL/B81/B/FevJ/FCD/Rw3/
R3Ej+T+GK8n/MZ1/Vf/HkCD/x7CB/B8z/B/T+VfjH8NR5P8Y9pD/Y7iP/B/D
deTfGNrI/zG8Qf6PwUn+j2EZ+T8Gi/wfQ4z8D+BB8j+AT8j/AB4i/wOIk/8B
XV/U+AO6/qjxB3h/4g7w/sUK8P5mIsDnH4UAn49MBfj8pBjAt8j/AO+/SgE0
kf8BtJH/44b/43iI5n8co+T/uOH/ON4i/8fRTP6P6/yr8Y/r/Kvxj/Pz/8Q4
PqP1P44TyP9x/f2fGv+44f84suT/OD4n/8d1/tX4LfT8XuR7voXa0yYbVnz6
tu1/pcX+V1n4QPrvsLBG1pdqS+//Vb204JP1abGFGek/LH7+r7WwR/pfZ2FS
1sd6i/13Wjr/dttlYbGsv24LL8v67LdwPZ3fWtgg63vCQk7W/wmLz/93WDr/
qj5b7P+khbulP1MWjpM+7bJ0/lX9Lo9P+jZt8fn3jKXzb7dnLZSknyULDdLX
/Rb7O2fp/Nvtg5bOv6r/QZ1/uz0/iE+l/5VBnX81/0F+/ncEMS7fvzrI168J
8vnE4iD2y8+PIFrl+GqD7H9d+fry/tQHMSvvnzPI/ruCeEzef3cQo3J+/EFs
oe9vgux/Iqjzr+Y/iIBcHzuCyMj1UwjiWbm+JoNwyfU3VR6PXJ+7ggjR/jWI
l+T6ng7if+X6nwniB9L/2aD+/k/Nf5D93x/EghNF/uaC+nxezX8Qp5P/IVwl
/Z8fQnND9Jgjrztk+18ZwiH5fFBVfl367wjh2VdEfakOYUrWn5qQzr/dXhzC
59J/hPCk9L82xN9/1oVwu6yP9SGslfXTGUKPrK+ukP7+T9XbEGZkffaHsJXO
b0PolvU9EWL/J0Ls/44Q+18IwSV9mQzhKenPVAhHSp92hfT5n6rfIdwtfZsO
4Wrp30wIW6SPsyGdf1XfQzr/dnt/CLXS37kQhqXPB0OIkP9hTEnf54dxQPpf
abxeFeb+jjAC8v2rw3z+UBPmz7c4zJ8fYbjk+GrDuv6p+Q/jLnl/6sP6+UnN
f5i//3eF8R/y/rvDfP7vD6ODvr8J4w45v4mwPv9V8x/W+VfzH9b5V/MfRsVe
sb4mw+iS628qzP7vCiNK+9cwbpDrezqMv8n1PxPGj6X/s+X3l/6Xwtgu87U/
jFtk/ubCWDAr8nkwbDz/R3T+1fxHUCH/VEawRH7/XxXh80NHBIvJ/wiek9//
10RwOvkfwddk/UIEp8n6VhvB0+R/BC7yP4IE+R9BF/kf4e//3RG8SP5H+Pdb
VgSryf8IfFT/y/+e/I9gHfkfQSf5H8Fd5H8E88j/CB4j/yPYQf5HkCb/I9hA
/kfwAvkfwXLyP4Lzyf8I3OR/BAPkfxS3kf9R/In8j+J28j+KYfI/yu9fHeXr
10SxhvyPYpb8j2I9+R9FivwvX5/8j2Ka/I/y/XVFDf+jCJD/UfSS/1Hkyf8o
//5vIqr3/2r+o8iR/1H8hvyP6vyr+Y/iFvI/ihj5H8Ur5H/U8D+KfyT/y5+f
/I8a/kdxn9x/z0VxEvkfxVnkfwyHyf8YCid3rzz8xE61/4/hIvn9f1UMq8n/
GM4h/2OG/zHcTv7H8CX5H8Nj5H/M8L/8ecj/GOrI/xj/vsoV0/t/Vf9jhv8x
NJD/MVxO/sfwS6r/MVxL/sf0+Z+q/zHD/xiK5H8MXyf/Y4b/MdxD/scM/2PY
Sv7H9Pmfqv8xbCb/Y4b/McP/mPH8H8dO8j9u+G+8XhXn/o643v+r+Y/z7w9q
4vz5Fsf58yPOv2+sjeNm8j/O+6P6ON8/ZxzfJf/jvP9yxw3/4+gi/+OYJP/j
xvzHESb/4/z70UIc88j/ONzkf9zwP65//6Pmvzxe8j+u86/mP274H4eP/I+X
vZf+xzl/c3GcSP7HDf8TOv9q/hOokH8qE3CQ/wk+P3Qk+PmiOoEnyP8EFpH/
5evR83/C8D+B3eR/As3kf8LwP2H4nzCe/xN4jvxPGP4nsJL8T8BD9T/BPuxI
YA35X74++Z/AJPmfwFfJ/wR2kf8JbCf/E+zfTIJ9nE3gefI/gWXkfwLnkv8J
9JD/CcP/JG4l/5N4m/xPGv4n4Sf/k/z+1Um+fk0Sq8n/JF4l/5OG/0nD/6Th
f9LwP8n315U0/E/CIv+T8JD/ScP/JG6h+U9ijPxP8vopJHl9TZbvB/mfxG3k
f3l85H8Se8n/pOF/EmeQ/0kMkv9Jw/8kHiH/k8bzf9L4/j+F778u/U+htX/Z
zVd/8aV6/k9xfahKAeR/CtXkfwo7yf8U16fFKRwi/1N4gPxPcf2rS3F9rE9h
Oflf/rzkfwo/Jf9Tev+v6n8K9eR/CpeS/ymj/qf0+Z+q/ynD/xT7Mpkynv9T
xvN/yvA/ZTz/pwz/U8bzf8rwP2X4nzL8Txn+pwz/04b/acN/4/WqtOF/mr9f
qE4b/qcN/9OG/2k+/69NG/6neX9Unzb8Txv+p3n/5U7z/syfNvxP407yv9ym
+U8jTv6nDf/TmE/+p+El/9OG/2kkyf8072+n07z/nUnr/Kv5T2OI/E/z/np/
GrvJ/zROJ//Thv8ZnPS69D+Dcz5rO/nxG36t9v8ZHH5F+p/h5wdHhp8vqjN4
iPzP4ETyP4NPyP8MTif/M3iS/M9gK/mfMfzP8PerrvLnI/8z/Hzmz/Dzm5XB
CvI/AzfV/wyy5H8Gq8j/jOF/BneQ/xkcQf5n8Cj5n8G15H95fOR/BmvJ/wye
Jf8zhv8Zw/+M4X8GXvI/iwL5n8Vb5H+W9wdVWcP/rOF/1vA/a/ifxSvkfxbr
yP8skuR/1vA/i2fI/yzfX1cWvyL/swiS/1n0kf9Z5Mj/LP/+c6Lcn/zPGv5n
+XxpMgsP+V9+P/K/fD3yP4s/kv9Zw/8sziH/s7DI/6zhfxbT5H+Wz+cOZg3/
c2gh/3M6/8r/nM6/qv85/BP5n0MV+Z8z/M/x+eTiHA6Q/znD/xyff9bl+Hy0
Pmf4n8M28j+HGvI/h5fI/xzWkv85LCH/c7iD6n9On/+p+p/DevI/Z/if4/Pn
qRzmk/85Pr8u5vh8ezqHCfI/h83kf844/88Z5/85LCX/c4b/OeP8P2+c/+cN
/43Xq/LG+X/eOP/PG/7njfP/vHH+nzee//OG/3nj+T9v+J83/M8bz/95/v//
/Hn0kP954/k/j3to/vNIkf/lNvmfxzfI/zz85H8ebeR/HlnyP8/fb03nDf/z
OJf8zyNI/udxG/mfx2/J/zxA/ucN/yeQkP7Pm8D5Jx84//nuPU/8H0RBR7w=

           "]]}}, {}},
       AspectRatio->NCache[
         Rational[1, 5], 0.2],
       Axes->{True, True},
       AxesLabel->{None, None},
       AxesOrigin->{0, 0},
       DisplayFunction->Identity,
       Frame->{{False, False}, {False, False}},
       FrameLabel->{{None, None}, {None, None}},
       FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
       GridLines->{None, None},
       GridLinesStyle->Directive[
         GrayLevel[0.5, 0.4]],
       ImageSize->720,
       Method->{},
       PlotLabel->FormBox["\"Window Length = 201\"", TraditionalForm],
       PlotRange->{{0., 1025.}, {-1.3368898533922202`, 1.3368898533922202`}},
       PlotRangeClipping->True,
       PlotRangePadding->{{
          Scaled[0.02], 
          Scaled[0.02]}, {
          Scaled[0.05], 
          Scaled[0.05]}},
       Ticks->{Automatic, Automatic}]},
     {
      GraphicsBox[{{}, {{}, {}, 
         {GrayLevel[0], PointSize[0.005555555555555556], Thickness[Tiny], 
          LineBox[CompressedData["
1:eJxd2nl8lNW5B3Da0oq21nhdCO31dnArWsWoqGERfoBgFNAoAgFZhoSEQFgm
+2R/Z99ncq33SluFERXBBSKiRot1rveqqQvEBUhQcACBiFuslmLr59q5vud8
7vM7/MPnvJMz73ve8zzP933PmZGla+8s/+GQIUN+MHTIkP/73/43OOm0hede
e+mmp3aqA+jbd+aX5b/aMsluDsMPd1y2c9Pw51U7D5OWJtfk9bys2ufijE0r
JnSf6lHtfJy7ZGTLNyN2q/a/4rv1e0b/5N53VNuB9371eP3vU3tU+0JUbNm6
6XBbn2pfjMzCQ6fnLXpftS/F2JM/KVz0m4OqPQqffHfh70K1WdW+HK9Ubh07
/rVDqn0FClyHvv3bWUdUezT2XnD6JV/N/Ei1C7Dh0/iYFW1HVftqvDG+o2J9
+phqX4Mntq288MNnjqv2tbhx+HlV1s4B1R6DyaGvbs4+/bFqX4eHHvz5ZRV/
OKHa1+PGNSOm+Wo+Ue0bsO1F68vthZ+qdiGqX5vwdfNnuj0WNyWu2V3V+Zlq
j8PR4MmhI0d+rtrjsf/KV+dO3qDbE7C34J5/tJ/xhWrfiG0L/7b7vlLdnojz
HxnWMedR3Z6ESy95+6FEn24D7aubjow8qdoWYB8fVJ9PNj6fbPSfgnz5/dYU
bKfzT8V+eX3WVPTT9d+Ej+T4rJswncY/DbXy/ljTsJ3u33RMkvfXmo5NdP9v
xjQ5P9bNmE7zV4Rn5PxaRXiP5v8WPCDjw7oFeyh+bsUYGV/Wrfgzxd8MDMr4
tGZgCsXvTLwu49uaCRfF/yx8JvPDmoURG2T+3IYzZH5Zt2EI5d/tuE7mp3U7
RlP+FuPqPpHfKMYZ0fUzxza9MMH++2K8Zuf/S9+3M8X45unv+9vtIXfgl/b3
223cgWOPfH9+u23dgcHF31+f6n8HzrSvX/W/E4fs8an+d2KZPX7V/078yb4/
qv+duMG+f6r/bJyw76/qPxv/Y99/1X82rrLnR/WfjV57/lT/u7DOnl/V/y70
2vOv+t+Fp+z4UP3vwhQ7flT/OTr/Vf852GjHn+o/BxPs+FT95+j8V/3nwmXH
t+o/F1Pt+Ff95+KwnR+q/1zss/NH9Z+HPju/VP95eMrOP9V/Hobb+an6z9P5
q/qX6PxW/UtgHx9U/Y3PMyVG//k6/1X/+Tr/Vf/5Ov9V//k6/1X/BTr/Vf8F
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
kv9tev9P1f82PEj+t+n9PzX+NlxL/rdhPfnfhgLyvw2Pk/9tvL7d2abzX42/
Tee/Gn8b9pD/bXr/T42/Tee/Gn+b4X+bzn81/na0kf/tsI9r/9sN/9sN/9sN
/9sN/9vxAfnfbvjfjk/J/3bcQuNv1/mvxt+u81+Nv12vr6rxt+Mx8r9dr8+q
8bdjBvnfodd31fg7sJ/mvwMPkf8dOE7+d2A8+d+BA+R/B06S/x0YQ/53oI/8
78BSiv8OfEv+d+B08r8DFeR/B/6N/O/Ab8n/Dqwi/y08If0fZqn1v722/3kW
Zkj/8y3slP47LEyQ9WWUhR7pf4GFs2V9KrTwofQfFt6R9a3IQqGsf8VWLp5E
fSyxcKasn04LR2R9rcz9vay/LgtTZX12W8b6rYV7ZH0PW9gh63+npfeH7PY6
i/f/0xaukb5sthCX/nRZvD7dben8V/XbQoX0rcfCLOlfr8X7432Wzn9V3y3s
kr4OWLz+Pmix/6csw38PWqXvwzywjyv/8zzokJ/ne3CZ7O/w4Fz5/aM8ev9R
zb9H57+afw+OyuuHh/c3ijw6/9X8e9Au70+JB6/I++f06P1VNf8ePC7vv8uD
2XJ+3B7cQPs3Hr2/q+bfo/Nfzb8Hf5Txsc7D+0fp3PllfG324KCMvy4Pzhly
0f/HZ7cH19Pza+58Mr57PFgv47/Xg5dlfvR58FPpf9aDlTK/BjxIS/8HPRgh
8/OUB3XkvxcvSv+HebHxu+TIC84+afuf58VY6X++F09L/x1ePO8U9WWUF5Nl
/Snw4meyPhV6cUD6Dy/ulfWtyItqWf+Kvdgq62OJFz+V9dPpxf/K+lrp5f1X
lxejZH12e7GT1m+92CLre9iLP8v63+lFWvqwLvd90o+0l/eXN3vxgPSny4ur
pE/dXrxAfnn171vsdo8XkP71etEvfezz4qD0M+tl/we87P+gF2dLn095jf17
H/s/zAf7uPI/z/g838f9HT72f5QPz8nzF/jwnry+Qh8+kNcPHz6T4yvyYa4c
f7FP/z5Kzb8Pz8r75/Rhlry/lT78Tt5/l49/n+H2YSbt3/jwmpzfsA+v0Pz7
8LCMj3U+fCzjJ527Xhlfm338+5MuH07J+Oz2wUXPrz5slPHd40O5jP/e3Hw4
RH70+TBD+p/14Su5vzbgw69l/g36cL/0/5QPrc9I//3YLff3hvnV+v9+5b8f
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

           "]]}, 
         {GrayLevel[0], PointSize[0.005555555555555556], Thickness[0.01], 
          Opacity[0.5], LineBox[CompressedData["
1:eJxd2WlsI3cdxvE/qIgUcRiE2nAPZ8MhGChHWgr9cRTSE++2QDi2nVDadTg2
AzHEENP8czmOkzgjeIGFEEwRXVIJiisOBSjqAAIsxGGEKNlKwLRIEPECuUJC
hjdQZIPm+e6b1WdHs7Pe/T3P7z/eZ79v4eQtj3TOPeI85/778+jH4PJHv/fJ
F7/g7O2XjX/BRr77nhEn7Ke/e9xDtzzrzntHLtlfxU+2Zx0VPWn//MYL7zl7
4XfGfro9/5tFB/Zi8XPsaXPtM6XeD8d+nr1S/AI7IZ6yP98xf9nhsDf2i+zx
Z4t+iT1N/FI4hF8OvwK+GH4l/Cr41fBr4Gn4EvhS+LXwZfDr4NfDl8Om9rB7
A67D7o24Drs34Trs3ozrsLsC12H3FlyH3VtxHXYzuA67K3Eddlfh+lV2nly/
WufTX435vcYuLdpfg/m/1l5TzIe/Fvm5TvPlr7M3Sv7epnn0b0N+y+N8/2CU
bytr3n3ZHtP6wjWXfOK7oz7Iyvat0f2Xj+4/YUdF2wl7+VHB/oQ9NPrzjZyd
sEd+s2B30l5atJ20C0eff3z/SXtV0dlJu7xod709OPr7Hd9/vbmzBfvr7TFF
Z7C7QW2whzPYvR33wx7OYPcO3A97OIPdO3E/7OEMdrO4H/ZwBrt34X7Ywxns
3o37YQ9nsHsP7oc9nMHuvbgf9nAGu1N2vtx/CvN3SuczO2Wvl/m9UefbbsT8
32hWzEd2o+bF3aT5spvsBsnfTZrH7CbkN7LzF8/d+/Un/GSU7yDSvFuk/RBF
9uVif/hI+ySNtH+yyI6L/ZRHOA/Mab8Fc/akYv/ZnPZhNIe+nLPfF/s1ndO+
zea0j/M5e5z08/vUAWxwBHs4hTM4h93NeD5scAR7OIUzOIfd+/F82OAI9nAK
Z3AOu1vwfNjgCPZwCmdwDrtb8XzY4Aj2cHqrzlt2q85nfqutyX4/rfMcnMb8
n7aZYj6i0zgPnNZ8paftlnPF/J3WPOanNb+uMs77z0b5Dio4D1S0H6KK9oev
aN+kFfu09E3F/ljsp7yifeXmtd+Cee0/m9e+jObtWunHeTtX7Nd0Hn07r/2c
z9sTpb8/oA5ggyPYwymcwTnsPojnwwZHsIdTOINz2H0Iz4cNjmAPp3AG57D7
MJ4PGxzBHk7hDM5hdwbPhw2OYA+nZ3TesjM6n/kZa8j+X9B5DhZ03m3BThTz
ES1oXvyC5itdsKVzxfwtaB7zBc2ri+2xt9987ocP/nKU71KM80Cs/RDG2h8W
my/2SznW/oliu6/YT3GsfeVj7bck1v5LY7uy6G6s/ZnF9ttiv/Zj9G2s/TyI
7QLp/4+oS3AAh7DBZTiCY9jDCZzCXTiD+3AOD2D3UXx+OIBD2OAyHMEx7OEE
TuEunMF9OIcHsFvE54cDOIQNLi/ivLCo8xkvWkvOr4s6z8miznu6aO8u5qO7
qHnJFjVf/UVrFvOXL2oeB4uaV1cd7/tfj/JdquI8UNV+CKt2ptgfVtV+KVe1
f6Kq/aLYT3FV+8pXtd+Sql1R7L+0qv3YrWp/ZlXrF/u1X0XfVrWfB1V7qvT/
x9QlOIBD2OAyHMEx7OEETuEunMF9OIcHsPs4Pj8cwCFscBmO4Bj2cAKncBfO
4D6cwwPYLeHzwwEcwgaXl3BeWNL5jJdsX86vSzrPyRLmf8luLuaju6R5yZY0
X/0l+1wxf/mS5nGwpPl1NWv+5eP//Ov9vxnv/5rmPahpP4Q1O1XsD6th/9e0
f6Ka/Vj2f037yte035KamfRfDfu/pv2Z1eznsv9r2rd5Df1fs2dK/39CXYID
OIQNLsMRHMMeTuAU7sIZ3IdzeAC7T+LzwwEcwgaX4QiOYQ8ncAp34Qzuwzk8
gN0yPj8cwCFscHkZ559lnc942T4j+39Z5zlZxvwv24dk/y9rXrJlzVd/2b4q
+39Z8zhY1vy6+vi8f994/9c170Fd+yGs29Wy/+vaJ+W69k9Ut3tk/9e1r3xd
+y2p22XSf3Xtw25d+zOrW0/2f137Nq+j/+uWSv9/Sl2CAziEDS7DERzDHk7g
FO7CGdyHc3gAu9vw+eEADmGDy3AEx7CHEziFu3AG9+EcHsBuBZ8fDuAQNri8
gvPPis5nvIL9v6LznqzYU2T+V6wq+39F85KtaL76K/Z92f8rmsfBiubXefvS
v9vPfsYT/zHK94THecBrP0x6u6TYH4HXPpny2j+ht28U+2naa1+Z136b8fad
qNB/Za99OOu1PyOv/Vrx2Dfe3lB0DfZwE07gDpzCB3AXPoQzuAf34SM4h4/h
ATyE3ap6Ai7Bk3AAT8EhPA0bPAOX4Vk4gitwDNdgDzfhBO7AKXywahfJv/+q
zuPhqn1ezq+rOs+9VZ3//qrVv1XIx9Gq5iVf1Xwdr2r+Bqua1+Gq/Uq+/18b
v+/fP8r3xBrOA2vaD5NrNnVfoT+CNe2TqTXtn3BN+2l6TfvM1uzOomfWtP/K
a3Zx0bNr2pfRmt1b7NfKGvp2Tfu59vDzZP/ATTiBO3AKH8Bd+BDO4B7ch4/g
HD6GB/AQduvqCbgET8IBPAWH8DRs8AxchmfhCK7AMVyDPdyEE7gDp/DBOs4r
6zqfh+s6z9m6Pafo3rrOf39d83G0bo2i83XN0/G6PSD7fl3zOFzX/LoN7P8N
7YPShl36sZV/uDsfGO//De2PYMMukP2/oX0TPvz7y/7f0L6yDe23mQ3ryv7f
0D6c3dD+jDa0bysbNi39v4H+hz3chBO4A6fwAdyFD+EM7sF9+AjO4WN4AA9h
t4n9D5fgSTiAp+AQnoYNnoHL8CwcwRU4hmuwh5twAnfgdFPn7WDTXib//ps6
n4ebdofs/02d596mzn9/0/Zk/29qXvJNzdfxpuZxsGl/L+Z1uIn939B8TzTG
3//9YZz/hvbBZMMeJfu/oX0y1dD+CRvaV9MN68j+b2D/N7QPyw17kez/hvZn
1LBvy/5vaN/GDfR/w+6W/oebcAJ34BQ+gLvwIZzBPbgPH8E5fAwP4CHsttQT
cAmehAN4Cg7hadjgGbgMz8IRXIFjuAZ7uAkncAdO4YMtnP+2dD4Pt3SeM7i3
pfPf39K8HG3ZZ2X/b2m+jrfsvPuL+39L8zjc0vy6pj1356G/PHDFcLz/m8h/
E/u/qX0SwFNN7Z+waYns/6b2lTW132aa9hXZ/03tw9mm9mfU1L6tNC2U/m9q
P9dgDzfhBO7AKXwAd+FDOIN7cB8+gnP4GB7AQ9htqyfgEjwJB/AUHMLTsMEz
cBmehSO4AsdwDfZwE07gDpzCB9s6f91tnc/Dbfua7P9tnefets5/f9u+KPt/
W/OSb2u+jrex/7ex/2HXGn/f/7/930L+W9oPky178LfF/d/SPplqaf+ELez/
lvaXtbTfZlrY/y3sfzhq2V2y/1vat3EL/d+y70r/w004gTtwCh/AXfgQzuAe
3IeP4Bw+hgfwEHY76gm4BE/CATwFh/A0bPAMXIZn4QiuwDFcgz3chBO4A6fw
wQ7Ofzs6n4c7eP/fwf7fwf7fwfv/Dvb/Dvb/jl0k+39H8zjc0fy6Xez/XfvI
PdXf/O22/73/72o/TO5aX/b/Lvb/Lvb/rt0m+39X+8p2td9mHrbs/13tw9ld
7c9oF+//u9j/u+j/Xbz/wU04gTtwCh/AXfgQzuAe3IeP4Bw+hgfwEHZ7eP+H
S/AkHMBTcAhPwwbPwGV4Fo7gChzDNdjDTTiBO3AKH+zh/LeH9/89+7bs/z2d
596ezn9/z+6W/b+necn3NF/He/r922BP8zjc0/y69vj/+/403v9tzXuprX0w
2bZ7Zf+3tU+m2to/YVu/n5xua19ZG+//bXz/39Y+nG3j/b9td8j+b2vfxm30
f9t+JP0PN+EE7sApfAB34UM4g3twHz6Cc/gYHsBD2O2rJ+ASPAkH8BQcwtOw
wTNwGZ6FI7gCx3AN9nATTuAOnMIH+zj/7et8Hu7r/19l+zrPvX18/79v35P9
v695yffx/f++XSX7f1/zONzX/LrEvnzBDXed/eS/Rvv/vOT/ef8PDU9BNw==

           "]]}, 
         {RGBColor[1, 0, 0], PointSize[0.005555555555555556], 
          AbsoluteThickness[1.6], LineBox[CompressedData["
1:eJxd2nl4lNW9B/DYx96LF23jbb03WNTRKlJbMSLViNtXtkYEHNmMyDJkT8gy
SSbJZH9n32fiTum9OnW5UusSsVau8tARvZJatKlrQFtHsJoqasRqUSjead9z
nuf3PfzT5/T1zHnP8vt9zjlvzqxsXV7zjaKiouOOLyr6x//a/yav+rf4XUsu
7Xlqh/o/cOSNkz6tOeMXV9nFKfjsuop9D72yS5WLMfeNP3zwl2//VpW/i3+f
/vD2m/F7VS5BdPrPmt57+TVVno4pJ+b/+MnecVV24O3kE2cHX3tTlc/CVwe/
avl8Mq/KZ+PhRbc5kq79qjwDbd954Mltuw+o8kxUN1yx9YnH3lPl81D+8mh5
wzcnVPlHeHLvkakzlv1FlWdhXeT7c85MfKDKpZix+oH5dz79oSpfiOX3/7Rz
z58OqvJsXDQtdOFJf/1IlS/Cc9YFvY989bEqz8Ho5Ek3fOvQJ6r8Y9we+u70
F5omVfli7P9w2oMV47p8CX5261LLfdmnqlyG/s2/9L16uy5fipq+GZ8seV+X
5+Ji75T4AxccUuXLMHLt5LYnW3T5csxaujq0+j5dvgLfOxD9pHJMl6/EssjJ
u585pMtXYfXuzr3rpn6myoD/w2u+PPdUVbaAZ+ek/vU/z9DPrzaeX23Un4fr
5O9b8zCd2p+PUvl+1nzj/Rfgx7J/1gLUUv8XYkCOj7UQ/0XjtwgH5Phai3AH
jf9PsEfOj/UTvEjzV47L5fxa5biJ5v8anC3Xh3UN1tL6WYyn5fqyFmMxrb9r
0SjXp3UtOmn9LsGv5Pq2luBrWv9LcUTGh7UUZ1H8LENAxpe1DMUUf9fhChmf
1nU4wSnj1wnvuIhvODGlY+9vHv3285fb/70TR+34/80/yzknPrDj3y4XXY+T
7d+3y7geh773z/btsnU9PPb7qfrX41v2+6v6y3HQ7p+qvxyH7f6r+svxkD0+
qv5ybLLHT9VfgUp7fFX9FVhgj7+qvwLb7PlR9VdguT1/qv5KnGrPr6q/Use/
qr8Sc+z1oeqv1PGv6q/Cc/b6UvVX4RZ7/an6q/C2vT5V/VX4qb1+Vf3V6LHX
t6q/GlX2+lf1V2O2HR+q/mo8bMePqn8DzrfjS9W/Aafa8afq34Cldnyq+jdg
pR2/qn4FLDu+Vf0KPGPHv6pvPM9VGPVv5N/HjUb7N+r8pOrfiEfo/dfgItk/
rEE19X8N+uT45NZgC43fTXhHji9uwm00/jfp/KzqF8o0f2tRJucXa1FB878W
Drk+coXntH7WaV9U/XU6/lX9dTr+Vf11aKf1ux6Py/WN9Tr+Vf1CWcZHbj1m
UPxs0PGv6m/AtOky/jZgkYzP3AYd/6q+C1vGRXw7XDjx51V7d+1/yfYfLh3/
dn5wubBf+m+5cILML1mXjn+7nHPBLfNT3mX4vxEfyfzm2IgvZP7DRtwv86Nr
Ixpk/rQ2wiXza3YjLpf5N7cRj8r8nN+o41+1X6njX7Vfyf6jkv13VbL/ViWe
lb5kK3X8q/Yrdfyr9it1/Kv2q9ArfXNU6fhX7Vfp+FftV+n4V+1Xsf/ZKh1/
qv0qHZ+q/Sodv6r9avik745q7JL+w3juqsYqWd+q5v1Ftpr3H7lqXCDfL1+N
R8n/GsyR/XPU8P4HNbw/ctXw/smq4f1Vtob3X7ka/FbOT74GL5D/tZgr59dR
ixtp/mtxllwfrsJzuX6sWvyvXF/ZWiyh9VeLBrk+87UIkv91+LVc3446HKP1
X4fjUyI+XHX4oYwfqw5BGV/ZOlRK/3N1WCbjM19n+F+PndJ/Rz2i73d9+cG+
V2z/Uc/+u+rxjvTfqse5Mr9k6/ENmX9y9WiS+Slfj/emyvzVoONf5Z8GvC/z
HxrYf1cDNsj8aTVgvcyv2Qa9/1ftN+j4V+0X/nvK343sv6OR/UcjfiB9cDWy
/1YjnpK+ZBtxq/Qn14i3pE/5RsP/TXp/q9rfxP5jk94fq/Y3sZ/WJvY1uwnT
pL+5TexzfpPhd5OOb9V+k45/1b7x3NWk41+136TjX7XfxP7nmnT8q/abdPyr
9ptxieyfo1nv/1X7zbDk+Lia9f5ftd/M+6tss97/q/ab8Yycn3wz9pD/LbhQ
zq+jRe//Vfst+L5cH64W1Mv1Y7Xo/b9qv1Cf1l+Ljn/Vfgu85H8rnpbr29GK
o7T+WzElJeLD1YqTpf9WK+6R8ZVtxSaKv1b8j4zPfCsuJf/deGeviO9iN+LH
Lgt7Fozb/jvcOCrzQ6kb49J/uNEs84vTjdky/7jcCMv85HZj/1SZv9zs/7Ab
78r8l3XjEZkfR9x6/6/ymxtrZX4dc2OhzL95N0Zkfp506/hX+a8N02V+L25j
/x1tOE/6UNqG56UfaNPxr/rfpuNf9b9Nx7/qfxv7b7VhUPo23Kb3v6r/bXz+
H2nT8a/638b+j7Xp+Ff9b2OfJ9vY76J2Pt8Xt/P532E8L23n+mjn87+znf13
tfP5393O53+rHWWyf8PtfP7PtsMnx2ekHf8txy/XzvursXbcKcc/367PZ6r/
7XiJ/O/AbDm/xR1YT/PfwfdDpR1olOsHHdgp15ezA+vk+nN1sP/uDvTS/rUD
L8j1PdyBoo/k+u/AidL/kQ6cIv3Pdej4V/3vQIeMv3wH3pbxOdmBcvLfg+P3
ifgu9iBxynHfOfbwW7b/Do+Ofzs/lHrwLzJ/wIMWmV+cHlwk84/LA7/MT24P
/ij9tzzs/7AHkzL/ZT06/u3yiIfP/zkP1sj8OubBfJl/8x4d/3Z50mP436nj
X+W/TqyU+d/RqeNf9b9Tx7/qfyd2SF+cney/q5P9d3fy+dXq1PGv+t/J599s
p45/1f9O9j/Xyb6OdbK/+U72ebKT/S7q0vGt+t+l41/133he2qXv/1T/u+CU
v+/s0vGv+t+FC+X7ubvwGO1funCp7N9wF+qo/106/lX/u3T8q/53IS/Hd6wL
m+X457v4fmayC2Pkfzff7xR36/hX/e/GTLk+SrvRJNcPupGT68vZjQ1y/bm6
2X93N/pp/9qNPXJ9D3fr+Ff978bJ0v+RbkyT/ue62f+xwu/L+Mt3Y0LG52S3
jn/Vfy/O3Sf992LRfxz4/bOJvPLfiyPkvxfHyH8vash/r+G/F4Pkvxfj5L8X
H5P/hTL579X7f5X/vIb/XlSQ/17MI/+9hv9euMj/HsP/Hh3/Kv/3GP73GP73
6PhX/e8x/O8x/O/R8a/632P432P432P438Pn51wPn6/Hevj8n+9hnyd7DP97
ESD/e/Ec+W88L+3l+3/06vhX/e/l+39Xr45/1f9eHf+q/706/lX/e1FP/e+F
n/zvxV3kf6++/1P979Xxr/rfi+fJ/168TP734WLyvw8umv8+nEf+96GF/O/D
LvK/D5Xkfx/qyf8+DJL/fXiJ/O8z/O/DKeR/H04n//sM//sQIv/78Cn534dr
yP9+LCb/+zH684V3RHP7lf/9hv/9+Fye/9GPteR/v45/lf/60Uv+9+NV8r/f
8L8fB8n/fjxI/vcb/vdjNfnfD5D//Yb//Rgi/wdwGfk/gA7K/wO4hvwfwJ/J
/wG8Sf4P4F7yfwAHyf8BPEj+DyBN/g/AQ/4NYBH5P4Cd5P8AriL/B3Ae+T+A
DeT/AGrJ/0HcQv4P4lXyfxC3kv+DXB+DhXwq/R/Ej8j/Qcwj/wexi/wfxGLy
fxBe6n/h/cj/QTxC/g/iEPk/iF+Q/4OYIP8H8Rn5P4QK8n8Ifpr/IVxL/g8h
Q/4P4QD5P4Rq8n9Ix7/q/5COf9X/IT7/Dw/hb7T+hzCN/B/S3/9U/4cM/4eQ
Iv+H8BX5P6TjX/XfQstbIr6nWCg/f+vapZ+/a/tfbLH/JRYOSv8dFlbI/DLT
0vt/lS8tdMr8VGZhTPoPi8//5RZekP47LWyV+bHCYv9dlo5/u1xvoUzmX7eF
V2R+9lqopftbi+93oxYWyPw/bGGR9GGzxd+PsxZ2SV+2WkhLf0YsTEiftluG
X5b+vmWXRy20Sv/GLMyVPo5beFz6mbfY/wkLZ0p/JwvzI30+bGEN+e9DWPo+
xYdR6X+xD1H5vMSHdbK+w4fl8vdn+rj9Uh8ulu9X5sPT8v3hY//LfWiW/Xf6
EJHjU+HDL+X4uXx4T45vvQ93yfF3+3BAzo/Xh930/caHq+X8Rn1opPn36fhX
8+8r5FOxfrI+7JHra6sP9XL9jfiwRa7P7T74af/qw8tyfY/68He5/scK4yn9
H/fp739q/n3s/4QPU08T8Tfp0/fzav59mEX++3Gz9H+KH9VrQyefcPsR2/9i
P47I80FJ4bn03+HHntdFfpnpx4jMP6V+Hf92ucyPr6T/8GOn9L/cz98/nX7c
J/NjhR8rZf50+dEi82u9X3//U/nWjzGZn71+Hf8q//qxQub3qJ/9H/ZjsfRh
s1/vH1V+9uMT6cvWwvtKf0b8+Ej6tN2PbeSXHxnp22hhvKR/Y37Mkz6O+/Gc
9DPvB6SvE378UPo76cd66fNhP+rJ/wBuk75PCeA16X+x8bwkwPUdAVTK358Z
wIWy/dIA70/KAnhWvj8CWCL7Vx6AJfvvDPD+qCKAETl+rgCOyvGtD+AeOf7u
AD6U8+MN4Av6fhNAm5zfaACtNP8BLJPrY3MAt8r1kw2gaJ9YX1sDaJLrbyTA
/m8PIET71wC2yPU9GsCXcv2PBXCe9H+88PvS/3wAd8j4mgjgbhl/kwFMHRfx
eThgnP+DOv7V/AdRJP8VBzFffv8vCfL9oSOIMvI/iBfl9//SIGaR/0F8U+Yv
BHG+zG/lQTxP/gdRT/4HESX/g2gi/4P8/d8dxB/I/yCqyf8gziT/g5hH+T+I
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

           "]]}}, {}},
       AspectRatio->NCache[
         Rational[1, 5], 0.2],
       Axes->{True, True},
       AxesLabel->{None, None},
       AxesOrigin->{0, 0},
       DisplayFunction->Identity,
       Frame->{{False, False}, {False, False}},
       FrameLabel->{{None, None}, {None, None}},
       FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
       GridLines->{None, None},
       GridLinesStyle->Directive[
         GrayLevel[0.5, 0.4]],
       ImageSize->720,
       Method->{},
       PlotLabel->FormBox["\"Window Length = 221\"", TraditionalForm],
       PlotRange->{{0., 1025.}, {-1.1950903220161333`, 1.1950903220161297`}},
       PlotRangeClipping->True,
       PlotRangePadding->{{
          Scaled[0.02], 
          Scaled[0.02]}, {
          Scaled[0.05], 
          Scaled[0.05]}},
       Ticks->{Automatic, Automatic}]},
     {
      GraphicsBox[{{}, {{}, {}, 
         {GrayLevel[0], PointSize[0.005555555555555556], Thickness[Tiny], 
          LineBox[CompressedData["
1:eJxd2nl8lNW5B3Da0oq21nhdCO31dnArWsWoqGERfoBgFNAoAgFZhoSEQFgm
+2R/Z99ncq33SluFERXBBSKiRot1rveqqQvEBUhQcACBiFuslmLr59q5vud8
7vM7/MPnvJMz73ve8zzP933PmZGla+8s/+GQIUN+MHTIkP/73/43OOm0hede
e+mmp3aqA+jbd+aX5b/aMsluDsMPd1y2c9Pw51U7D5OWJtfk9bys2ufijE0r
JnSf6lHtfJy7ZGTLNyN2q/a/4rv1e0b/5N53VNuB9371eP3vU3tU+0JUbNm6
6XBbn2pfjMzCQ6fnLXpftS/F2JM/KVz0m4OqPQqffHfh70K1WdW+HK9Ubh07
/rVDqn0FClyHvv3bWUdUezT2XnD6JV/N/Ei1C7Dh0/iYFW1HVftqvDG+o2J9
+phqX4Mntq288MNnjqv2tbhx+HlV1s4B1R6DyaGvbs4+/bFqX4eHHvz5ZRV/
OKHa1+PGNSOm+Wo+Ue0bsO1F68vthZ+qdiGqX5vwdfNnuj0WNyWu2V3V+Zlq
j8PR4MmhI0d+rtrjsf/KV+dO3qDbE7C34J5/tJ/xhWrfiG0L/7b7vlLdnojz
HxnWMedR3Z6ESy95+6FEn24D7aubjow8qdoWYB8fVJ9PNj6fbPSfgnz5/dYU
bKfzT8V+eX3WVPTT9d+Ej+T4rJswncY/DbXy/ljTsJ3u33RMkvfXmo5NdP9v
xjQ5P9bNmE7zV4Rn5PxaRXiP5v8WPCDjw7oFeyh+bsUYGV/Wrfgzxd8MDMr4
tGZgCsXvTLwu49uaCRfF/yx8JvPDmoURG2T+3IYzZH5Zt2EI5d/tuE7mp3U7
RlP+FuPqPpHfKMYZ0fUzxza9MMH++2K8Zuf/S9+3M8X45unv+9vtIXfgl/b3
223cgWOPfH9+u23dgcHF31+f6n8HzrSvX/W/E4fs8an+d2KZPX7V/078yb4/
qv+duMG+f6r/bJyw76/qPxv/Y99/1X82rrLnR/WfjV57/lT/u7DOnl/V/y70
2vOv+t+Fp+z4UP3vwhQ7flT/OTr/Vf852GjHn+o/BxPs+FT95+j8V/3nwmXH
t+o/F1Pt+Ff95+KwnR+q/1zss/NH9Z+HPju/VP95eMrOP9V/Hobb+an6z9P5
q/qX6PxW/UtgHx9U/Y3PMyVG//k6/1X/+Tr/Vf/5Ov9V//k6/1X/BTr/Vf8F
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
kv9tev9P1f82PEj+t+n9PzX+NlxL/rdhPfnfhgLyvw2Pk/9tvL7d2abzX42/
Tee/Gn8b9pD/bXr/T42/Tee/Gn+b4X+bzn81/na0kf/tsI9r/9sN/9sN/9sN
/9sN/9vxAfnfbvjfjk/J/3bcQuNv1/mvxt+u81+Nv12vr6rxt+Mx8r9dr8+q
8bdjBvnfodd31fg7sJ/mvwMPkf8dOE7+d2A8+d+BA+R/B06S/x0YQ/53oI/8
78BSiv8OfEv+d+B08r8DFeR/B/6N/O/Ab8n/Dqwi/y08If0fZqn1v722/3kW
Zkj/8y3slP47LEyQ9WWUhR7pf4GFs2V9KrTwofQfFt6R9a3IQqGsf8VWLp5E
fSyxcKasn04LR2R9rcz9vay/LgtTZX12W8b6rYV7ZH0PW9gh63+npfeH7PY6
i/f/0xaukb5sthCX/nRZvD7dben8V/XbQoX0rcfCLOlfr8X7432Wzn9V3y3s
kr4OWLz+Pmix/6csw38PWqXvwzywjyv/8zzokJ/ne3CZ7O/w4Fz5/aM8ev9R
zb9H57+afw+OyuuHh/c3ijw6/9X8e9Au70+JB6/I++f06P1VNf8ePC7vv8uD
2XJ+3B7cQPs3Hr2/q+bfo/Nfzb8Hf5Txsc7D+0fp3PllfG324KCMvy4Pzhly
0f/HZ7cH19Pza+58Mr57PFgv47/Xg5dlfvR58FPpf9aDlTK/BjxIS/8HPRgh
8/OUB3XkvxcvSv+HebHxu+TIC84+afuf58VY6X++F09L/x1ePO8U9WWUF5Nl
/Snw4meyPhV6cUD6Dy/ulfWtyItqWf+Kvdgq62OJFz+V9dPpxf/K+lrp5f1X
lxejZH12e7GT1m+92CLre9iLP8v63+lFWvqwLvd90o+0l/eXN3vxgPSny4ur
pE/dXrxAfnn171vsdo8XkP71etEvfezz4qD0M+tl/we87P+gF2dLn095jf17
H/s/zAf7uPI/z/g838f9HT72f5QPz8nzF/jwnry+Qh8+kNcPHz6T4yvyYa4c
f7FP/z5Kzb8Pz8r75/Rhlry/lT78Tt5/l49/n+H2YSbt3/jwmpzfsA+v0Pz7
8LCMj3U+fCzjJ527Xhlfm338+5MuH07J+Oz2wUXPrz5slPHd40O5jP/e3Hw4
RH70+TBD+p/14Su5vzbgw69l/g36cL/0/5QPrc9I//3YLff3hvnV+v9+5b8f
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

           "]]}, 
         {GrayLevel[0], PointSize[0.005555555555555556], Thickness[0.01], 
          Opacity[0.5], LineBox[CompressedData["
1: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
T/b/vP8HOx1hlg==
           "]]}, 
         {RGBColor[1, 0, 0], PointSize[0.005555555555555556], 
          AbsoluteThickness[1.6], LineBox[CompressedData["
1:eJxd23mYVNWZBvDW0QSDGdsk4/RECAUB6ahAi1uLim8QoUHBYrVZLRoamqXp
6r16v7XvVa1Gw+iMlssYohIaFwRFLDESVNRGRRtBLXBD4tI6miAgTo33nOf5
3sM/PsfLqVPnnvN+v7sUQytqZlaeWlBQcMppBQX//1/7T/81P4vdfcMVLU9t
U/8Dx9/++VeVQ/58jd0cgP+9sfydR97YodqFGPf2niOfnvWiav8Kvxi0Ycst
eE21ixAZdNeaj1/fq9qDMODM3Ltf7utTbQfeTTwxPLB3v2oPQ805W+fsfv49
1R6Ojz5sPNC+J6fa5+HeTZH6+0sPqXYx3Jetd7ff8YFqn4+p91x8dsmRD1X7
Qjzx4PI3Pxv7sWqPxoLZqROf1Hyi2iUY/ttfnLk4c1i1L4Kz7rTxtz3/qWqP
xUUff/ndG31HVPti7Jh254TG9/+u2pdg5zOeIXvf+ky1L0Vx320FC7Z/rtqX
YccDdw/y3P6Fal+OS745/cU/LfhStUtx/GTuo8sH9Kv2Ffjw4IJZPfN0exye
eO/qL352n25fiTGPjvj3cw/q9lXY8Fj8063nfKXaV+POKdtn7Zyg2+PxyueT
LhhRqdvXYO+oh69+rkO3gVNmdi2KJ1TbAibctWN16y36+O+N4783+k/Aq/Lz
rQm4i8a/Fhvl97OuNb7/RDwu52dNxEc0/+twQp4f6zpcTudvEv4qz681CRfQ
+Z+Ml+T6WJPxMq1fGcbJ9bXKMI/WfwqGyf1hTcF82j9TsVXuL2sqptP+ux6N
cn9a1+NB2r834Ijc39YNaKH9Pw3/kPmwpmEY5Wc6/DJf1nQUUv5uxNUyn9aN
OMMp8+uEp0/kG04MqN/37Mazdl5l/30nTtj5f/bHdtaJI3b+7XbBDJxtf77d
xgx8fe6P49ttawYa7O+n+s/Av9rfX/WfiUP2/FT/mVhmz1/1n4n37fOj+s/E
f9nnT/WfhVX2+VX9Z2Giff5V/1nYaK+P6j8LTnv9VP/ZKLLXV/WfrfOv+s/W
+Vf9Z+v8q/5z8Jy9v1T/ORhm7z/Vfw622ftT9Z+DMfb+Vf3n4qi9v1X/uThk
73/Vfy422flQ/efiQjs/qv9NeMTOl+p/E/7Tzp/qfxN22/lU/W/CG3Z+Vf9y
/DDjx3yr/uWAnX/V3zieLTf6z+PPxzxj/Hm6Pqn+8zCKvv98PCrnh/n4gOY/
H8fk+cnOx1g6fwuQlecXC3Aenf8FeEGuT3YBdtL6LcRlcn2xEHNo/RfiN3J/
ZBdiLu2fRdoX1X+R9kf1X4RauT+zi3Af7d/F+FjubyxGHe3/xeiX+cguxiDK
z806/6r/zfiPQTJ/N2OSzGf2Zp1/1d+FO/tEvh0unHnv0n07Dr1q+w+Xzr9d
H1wuHJL+Wy6cIetLxqXzb7ezLrhlfcq5DP+XsP+OJXDJ+of8cVkfXUtwp6yf
1hJUyfqaWYIJsv5ml2CDrM+5JZhO9bsC58j67qjAdFn/UYEx0gdXBbLSD6sC
z0pfMhVwSH+yFXhK+pSrwCjya6nOvxp/KQ5K/7AUPdJH11JcIP20lur8q/GX
Yp30N7sUL0ufc0vxOvm9TOdbjb9M51+Nbxx3LdP5V+Mv0/lX4y/T+VfjL+Pr
k9wynX81fqXOvxq/UudfjV+p86/Gr9T5V+NX4ll5fjOVOv9q/EqdfzV+pc6/
Gn+5zr8af7nOvxp/uc6/Gj9/XO4fazlfX2aW8/VndrnOvxp/uc6/Gn+Fzr8a
f4XOvxp/hc6/Gn8FzpX5sVYgIPOVWYEK6X92BabLfOZWGP5XYbv031GFyCdN
3x155w3bf1Sx/64qHJT+W1UYKetLpgqnyvqTrcIaWZ9yVfh4oKxfK7FP1jfH
SoyX9Q8rsV/WR9dKxGT9tFZiuayvmZWYJutvdiUelvU5txLlVL9X4VeyvjtW
4QZZ/7EKv5U+uFZhu/TDWoXHpS+ZVRgi/cmuwibpU24VLiS/VrNvjtXISf+w
mn10rdb5V+OvxsPS18xq3CH9za7GS9Ln3GrsIb/X4KT03bEG10j/YRx3rdH1
Q42/RtcXNf4a/JHGX8PXJ7k1xvVLtb7+V+NXs/+oxvfy/LiqcZE8f1Y1npTn
N1PN/mer8bRcn1y14f9aXCDX17GW/cdaDJb7w7UWFXL/WGvZ/8xa3ET7by37
n1uLP5D/Ney/owZzaP/XsP+uGnwv82PV4D6Zr0wNVlP+avCgzGeuBleQ/24c
3CfyXehG7OSVoYaJfbb/DjdOyPpQ4kaf9B9uVMv64nRjrKw/LjdCsj653Tg0
UNYvN/bK+tbtxjhZ/zJu7JP1sceNiKyfWTeWyfra68b1sv7m3HhI1ud+t75+
U/WvFr+U9b2wFlNl/XfUYqj0oaQWz0g/UItHpS/OWgyW/rhqsVH65K7F+eRX
LfvWXavzr+Zfyz725PtLP7O1eEj62luL26W/uVqdfzX/WvSS/3U632r+dRgv
/XcYx0vqdP1Q86/jz3fW6fqj5l/H1yfuOp1/Nf86vv/vrtP3P2r+dXz/31On
86/mX4fN8vz21mGEPP+5Op1/Nf86w/96nC/Xt7Ce/XfU6/yr+ddjidw/qGf/
nfU6/2r+9ey/u17nX82/nv3vrtf5V/OvZ/976nX+1fzrdf7V/OtRL/OXq8f7
Mp/99Sgj/xtw2jsi34UNiP/bKb88ueGA7b+jQeffrg8lDfiJrB9owFpZX5wN
uFjWH1cDfLI+uRvwLtWvBuyR9a27AZfJ+pdpwNuyPvY0ICjrZ7YBFbK+9jZg
iqy/uQasl/W5vwGzyf9GnC3re2Ejpsj672jEEOlDSSOeln6gEZukL85GDJL+
uBqxQfrkbsTvyK9Gvv/vbsT70r9MI9//9+T7Sz+zjfiz9LW3EX+Q/uYa8aL0
ub9R51/NvwnfS98Lm3T+1fyN4yVN3B9NfH3hbOLrD1cTX5+4m4zrlyY8JufX
3cTPPzJNOv9q/k0okecv26Tzr+bfpPOv5t+Ep+T69DfhBfK/Wedfzb8Zs2n9
m9n/kmadfzX/Zvbf2cz+u5rZf3cz+281s//dzex/ppn972lm/7PN7H9vM9pl
/nLNOCzz2d+s86/m78HId6T/Hkw654PXno/nlP8eHCf/PThJ/ntQSf57DP89
6CT/Pegj/z3YTf7n+1P982Av+e+Bn/z3wEX+e1BG/nvwIPnvwSzyvwVnkf8t
mEz1vwWDyf8WbCX/W7CR/G/Br8n/FjxC/rdgJPnfwvf/3S14j/xr4fv/nhYU
k/8tOv9q/i24jfxvwS7yvwWvkf+tOEH+t+Jq8t84XtLK1w9oNfxv5esPV6vO
v5p/q/H8olXnX82/lZ9/ZFoN/1t1/tX8W/EE+d+K4eR/q86/mn+rzr+af5vh
f5vOv5p/m+F/m+F/m+F/m+F/G7+fcrcZ/rcZ/ufHp/3fZvjfhhPkf5vhfxuC
5H8bviL/2zCF/G/HVPK/Hbvuve6OSPaQ8r/d8L8d38r7f7RjIfnfrvOv6l87
Wsn/drxJ/rfjb+R/O0ZR/WvHG+R/O7zkfzsWk//tmET+t+MB8r8dM8j/Dvyc
/O/AdVT/O3Au+d+BJ8n/Dmwg/ztQRP534CHyvwMjyP8O/JP878C75F8HNpL/
HRhJ/ndgPfnfofOv5t+h86/m34FXyf9OHCf/O3X+1fw7df7V/Dt1/VDz7+Tr
C2enzr+af6fhf6e+f1Hz7zT879T5V/Pv1O9H1fw7+f1JtlPnX82/U+dfzb/T
8L/T8L/L8L/L8L/L8L/L8L/L8L/L8L9L51/Nv8vwv8vwv0vnX82/C1+S/106
/2r+XYb/XUiS/104Rv536fyr+VtYe0Dke4CFslHrF0779kPb/0KL/S+y8Jn0
32FhlqwvxZa+/lf10kKjrE+lFnpl/YKF52V9K7PwO1n/nBb2yPpYbqFL1k+X
hYWyvlbl+8v667awTdZnj4Ub6fmthYGyvkcsjJL1v9vi5//rLGyWfmQsPCx9
WW/hdOlPj4Wt0qctFoaTXxa+lL7tsvj5d6+Fv0gf+yydf1XfLdwvfT1ssb/9
Fv4mfT5q6fyr+u/FMen7AC+ukv4Xetn/Ii/f/zu82Ck/v9jL45d4+flEqZff
/8OLDXJ+ZV723+nl30eUezFenj+Xl/2v8rL/bi92y/XxeNFD72+87H/Ei1m0
/l5cIvfHOi/K5P7JeNn/9V72v8eLhNyfW7zsf9bL/u/yIi33f68Xj8l89HnZ
/5yX/T/sxcDBIn/9Xv18Xq2/F6PJfx9ukf4P8GHZwuDZZ9x+3Pa/0Ifj8v6g
KH9c+u/wYfdbor4U+9Aj60+JT+ffbpf6cEzWL/iwSda3Mh9Ssv45fVwfy31c
P10+fX7tdpUP5bL+un3YLOuzx4ep9PzWh1JZ3yP5/rL+d/swWvqwzqfzr+qz
D29KX9b7cKH0p8eH7dKnLT6UkV8+nPKD8G2XD59I/3p9/Hy8z4fLpJ85Hx6V
vh724b+lv/0+9Eqfj/rwDvnvx09mCt8H+DFZ+l9oHC/yc3+HH2/Kzy/24345
fokfm+T3K/XjUvn94cd2Ob8yP76W83f6USDPT7kfE+X5c/lxQJ7fKr/+/ZVa
fz965fp48t+f3t/4MVeub8TP/nf7MVbuj3V+eOT+yfjxodxf6/2YKfdfjx8h
uT+3+LGTrl/9yMn9vcsPn9z/vX4MTop89PlRJd//5/y4Q+brsB/3yPz1+zGw
T+TzqN+4/w/o/Kv1D6BA/ikM4Fr5/r8owM8PHQGUkv8BvCLf/5cEMJr8D+B0
+f4SATxN/gcwlPwPoIf8D+CP5H8A5eR/AMPJ/wCeJP8DOv+q/gfwU/I/gGKq
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
           "]]}}, {}},
       AspectRatio->NCache[
         Rational[1, 5], 0.2],
       Axes->{True, True},
       AxesLabel->{None, None},
       AxesOrigin->{0, 0},
       DisplayFunction->Identity,
       Frame->{{False, False}, {False, False}},
       FrameLabel->{{None, None}, {None, None}},
       FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
       GridLines->{None, None},
       GridLinesStyle->Directive[
         GrayLevel[0.5, 0.4]],
       ImageSize->720,
       Method->{},
       PlotLabel->FormBox["\"Window Length = 241\"", TraditionalForm],
       PlotRange->{{0., 1025.}, {-1.098017140329562, 1.0980171403295604`}},
       PlotRangeClipping->True,
       PlotRangePadding->{{
          Scaled[0.02], 
          Scaled[0.02]}, {
          Scaled[0.05], 
          Scaled[0.05]}},
       Ticks->{Automatic, Automatic}]}
    },
    GridBoxAlignment->{
     "Columns" -> {{Left}}, "ColumnsIndexed" -> {}, "Rows" -> {{Baseline}}, 
      "RowsIndexed" -> {}},
    GridBoxSpacings->{"Columns" -> {
        Offset[0.27999999999999997`], {
         Offset[0.5599999999999999]}, 
        Offset[0.27999999999999997`]}, "ColumnsIndexed" -> {}, "Rows" -> {
        Offset[0.2], {
         Offset[0.4]}, 
        Offset[0.2]}, "RowsIndexed" -> {}}],
   Column],
  Function[BoxForm`e$, 
   TableForm[BoxForm`e$]]]], "Output"]
}, Open  ]]
}, Open  ]],

Cell[CellGroupData[{

Cell["Plot Filter Trends", "Section"],

Cell[BoxData[
 RowBox[{
  RowBox[{"originalVsFiltered", "=", 
   RowBox[{"Table", "[", " ", 
    RowBox[{
     RowBox[{
      RowBox[{"sinWaveMedianFilterPlottingData", "[", 
       RowBox[{"128", ",", " ", "wl"}], "]"}], "[", 
      RowBox[{"[", 
       RowBox[{"{", 
        RowBox[{"1", ",", " ", "3"}], "}"}], "]"}], "]"}], ",", 
     "\[IndentingNewLine]", 
     RowBox[{"{", 
      RowBox[{"wl", ",", " ", "1", ",", " ", "256", ",", "2"}], "}"}]}], 
    "]"}]}], ";"}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"Dimensions", "[", " ", "originalVsFiltered", " ", "]"}]], "Input"],

Cell[BoxData[
 RowBox[{"{", 
  RowBox[{"128", ",", "2", ",", "1025"}], "}"}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"rmsRatio", "[", " ", 
   RowBox[{"{", 
    RowBox[{"data_", ",", " ", "filteredData_"}], "}"}], "]"}], ":=", 
  RowBox[{
   RowBox[{"RootMeanSquare", "[", "filteredData", "]"}], "/", 
   RowBox[{"RootMeanSquare", "[", "data", "]"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ListLinePlot", "[", " ", 
  RowBox[{"rmsRatio", " ", "/@", " ", "originalVsFiltered"}], " ", 
  "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, {}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.01388888888888889], 
     AbsoluteThickness[1.6], LineBox[CompressedData["
1:eJxd1XtM01cUB/DrA8VEnIoaEyWO+SJKULHTuc3xLQjaFqQvXn1QZaiMmLi4
RUWJXkUiFRuT6qaiYfPxh/gMTUBRtvyWGcumEUnUlYnxmemUKVhfc8nwwSE5
l5s0/X36zWn7u/ecNrZghXVJXyGEfPt499y9OpKEutC5sz6q/cFUej0SX+3i
Hgpbc9WJCLudPALey9yjYTKMm5YRsZw8FgeN3B/iqaE6qul0Kfkj9DFxT8D/
M3V1Owd5yZPQoOOOQ1FF5KYzgR3kKbihOB4JbU2BPTf3kRMQVDwd7QXX+gdG
HSLPgOFL7kQk1B/W+duOkGdir2IdaicmPg8trSV/jE7Fs6A/N8Af87qOPBtb
FX+CxaEl3vj4s+Q5CCj+FKPD1rnRUiN/hjTFn2Nk4aPqcY2/kufCoPgLrEuF
5Y4xSE5CnWLAfD8u1h9/odsS8HELPVJi7xa8WtRMuR4buUUyVg//+lRDuIXy
ZFRxixTUPDpaUeq5QnkKLnGLeSg8qd8wOHyN8nnwcYtUXMoqOLbheCvlqXjJ
LdJQ2ppZc9bXRnkaarjFfPxzvuPfVf6blM/HqCCzWIBb34T0Me7blC/AS25h
wKmBVl9tn7uUG9DCLYzQysfvGFZ/j3IjrnMLExKDnmnJJX9RboKJW6Rj0PHK
Fp3xAeXpmMAtMlB4P+PbpskPKc/AJm6xEOt+ObD/96HtlC/EHm6RiXvri8pe
9XtMeSa6uIUZHV3v1pNuw4yB7y/od0CasX7vyLJdorPbmhk+bmGBszi9ofo/
MixYxi0tOLN2SPjQ30+p3oIgt7Ci8o9Z06+eC1O9Fbu5pRUDin/u+qHiGdVb
MYxb2HD5u+irJTOeU70NrdzShs3F/sCRRrJmQyW3sGNl+5jwlLgXVG/HGm5p
x+bvo9Z6V5I1O7ZwiyyM9f5UFKrqqc9CDLfMwsXMYFL1jz31vXKRrRrZ6vvJ
bIzh1rJ7fX6OauSgnFvmoEz5/jko4fcnctX7Ra66H7KXtVxsU/YvD1u5kYdy
bpmHMmX/8/AnPx/hQEg5PwdalPNzoJlbcyBaOX+n2g9wIpJbOhGh9I8TVby/
hEvtN7jgU/rPpfan5sJvSv+6cZ4bbjRySzdOK/3vRjGfD5Gvzgvy4VLmJx8O
bi0f25X582AbNzyQ3NKDUmV+Pfjg/UXP//wi9CW/AXcZcv8=
      "]]}}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{},
  PlotRange->{{0., 128.}, {0, 1.414213418135648}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"absMeanRatio", "[", " ", 
   RowBox[{"{", 
    RowBox[{"data_", ",", " ", "filteredData_"}], "}"}], "]"}], ":=", 
  RowBox[{
   RowBox[{"Mean", "[", 
    RowBox[{"Abs", "[", "filteredData", "]"}], "]"}], "/", 
   RowBox[{"Mean", "[", 
    RowBox[{"Abs", "[", "data", "]"}], "]"}]}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ListLinePlot", "[", " ", 
  RowBox[{"absMeanRatio", " ", "/@", " ", "originalVsFiltered"}], " ", 
  "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, {}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.01388888888888889], 
     AbsoluteThickness[1.6], LineBox[CompressedData["
1:eJxd1XtsTFkcB/CztSsEWxJLtWNtPdaiqsyu9drO16ipjqEz0+pr5raKrmbL
1isEyTqWeIRIMETQPzai3vUIqeCP20pTgnqNZ6sttrah1FSr7Eq6mF+T37kn
ubn3k29+ufee8zv3Rs7Kd+eECCHkx+PTOTheW4Q64K6tyNnzRVtskJ1wu467
O7IrT1ryNDPV9URzFXcYTF97R61tcJJNGBDK/R1W7Jhvgm0OuT/m7uQeiC4d
rNqf1YvJ36NU8Q+IabuvFUStJg/FUcVR2F9dUnh0wiZyNFw13DGo+S/RtyLe
Rx4JzwfuUXjTuPzu0vK9ZDNWveb+EQ9i40MeHdxH/glmC/doNFRnB7Z2OUz+
GYk13GNge98as/DmCfJYrFY8DhVdI1oHW8+QxyO0G/cEHC48EFGVfY78CwKK
Y1FyoQ4VJp1swQvFQEl+b1mWezFoCTRwi4k4/VWf7rlh5ZRPxDNuYcXT8MtP
y6OvUG5FZASzmIQUf1VeftF1yifhL24Rh46/OxYXOW5RHofB3GIyIs2jw1e9
81M+GXZuYUPM7PrdvSrvUW6Dxi3i8dwf7dnZ/JDyeAy6wyymYI3J1nwrrpry
KdC5RQKu+uwFh+pqKU9APbeww/EAlw5cfEK5HRq3mIpTW06W3j//N+VTcYVb
OHC69EjtxmvPKHegjFtMg9kf2+9xaz3l05DBLaajct3zuY/GvqB8Or5czywS
0RJ4/G/KtpeUJ6JHE7NworHt02gMGk50/HxB3wHpxNolnX59GxUIWnfCxy1c
+EY/FXFkfBPVu/Att3RhkTn/n2PD3lC9C+u5hRsFNzL9ZR/IcGM/t3QjzGLv
Gyhqpno3BnCLJBzKSaiZY22h+iQUccskFBev9G0uJutJOMstktGQl53aOfQt
1SejiVsmY/hvOxpPJJB1g8UMaOfvHtyc215vsJyBYcv+aLk3r73ekIsUQ73B
0mA9BSOU+6eqzwODpcF6qvp+Ik010vBKef80dX70NMP8pauGwTLdMP/pOM7X
R2So64UMdT2lwXoGhijr71H7AR6Ec0sPeiv940Eh7y/hVfsNXrUfpRd7uHUv
Nir9q2EdNzQs5ZYaFij9r6n7Q2SqRqa6n6TBeiZ2KfsvC9u5kYUN3DILa5T9
m4Vuny/a//MzEUL+H8modek=
      "]]}}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{},
  PlotRange->{{0., 128.}, {0, 1.4015731420144657`}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]],

Cell[BoxData[
 RowBox[{
  RowBox[{"singlePointRatioMean", "[", " ", 
   RowBox[{"{", 
    RowBox[{"data_", ",", " ", "filteredData_"}], "}"}], "]"}], ":=", 
  RowBox[{"Mean", "[", 
   RowBox[{"filteredData", "/", "data"}], "]"}]}]], "Input"],

Cell[CellGroupData[{

Cell[BoxData[
 RowBox[{"ListLinePlot", "[", " ", 
  RowBox[{"singlePointRatioMean", " ", "/@", " ", "originalVsFiltered"}], " ",
   "]"}]], "Input"],

Cell[BoxData[
 GraphicsBox[{{}, {{}, {}, 
    {RGBColor[0.368417, 0.506779, 0.709798], PointSize[0.01388888888888889], 
     AbsoluteThickness[1.6], LineBox[CompressedData["
1:eJxd1H1MVXUYB/AnaiV5FZi26cYiWWMXdA6JRAHxC3JBebnce7hcLy/3HoN0
JWawpuYUOcrI2ctW6uaIfJtIpg4nylRacLLCuSgzldUfIJhmxYzuVWozLWv3
YXt+52xnZ59995yz3+/3PGdW9evayggiMv67/3+Grz8Wk3rh5bXe9MIzd7PC
nISb9dLRCEZM2frsYTvXTUfoCekZSHReb9ryvoMdi40l0s+h/9C/ae3D5ex4
PGiTfh4JPU8Ob1z9KjsBMb3SdhTXbohKeGo9OwkhxXPwz7qWhvHmrey5qFsv
nYzXKNB9J/lt9jw8/Zh0Ck78PvnzsU92sl9A1Jh0KiKbxjXH/hb2i9ikeD5m
/hnRURx9kJ0GXfECXMpOL8uY3c5eiCk50uloOz+zO5h6nJ2BqC+kM/HMQM9w
4sGT7EXQFGfh9od1N1ac7mIvRlqrNHDyTsAWr3eHbQD3pSkb7zacyR853st5
Nn6Qphz81rzHe+Xqec5zEPeWMC1B3t4dNXHz+jhfgs3SlIuf64b2Lgpd5DwX
MfXC5EDnZ76ar+K+5dyBkDTl4Rdnan/sS5c5z0NsiTDlY83RhNYTwSuc52OX
NC3F5cTBIf+FAc6X4vEkYVqGqdGd3qRff+R8GVzSVICrH63Rx/RBzgvwtzQV
Qo/v/7ijdZjzQmyXpiK8F/NG7U+9NzgvQpc0FaNj6PSDIfstzovxvTQ5sXvd
NIdj9DbnTpyTphJkhSI7v0se5bwEa6XJhfq4bX/NenMsbLjwipl5yzaJ/wOG
CysH7jdeOxYM23ShSZrcaOj5dAN9GeJ6N3ZIG27sy3TWZLTc5Xo32qVJg210
W+Gc7HtcryFa2tDgDjUGcvvYpgavNJXi674jtkNzx7m+FN9IG6XIj0zZXrCF
bVpMHhQ4UqptZyfqPdCkDQ/MU0d3PhycqLeYyjAyYrd3BSfqy3BT2ijDB1r1
7Lp7E/WWnLyq4VXfZ1hsei3fX64aFhsWm8vhkesjH1zK+n0oUtbvU/fH9Fn2
r1w1LDYsNstxSZ4PVajnhQr1PA2LzQrL+VeqRiU80kalpX8q1f6iKtWowlSl
/6rU/jSrcETpXz/apOHHAWnDb+l/P96R80EBdV4QQKMyPwF1vswAmpX502FI
Q8cqaUNHtTK/OmrlfNMKrGI/Au0Zbj4=
      "]]}}, {}},
  AspectRatio->NCache[GoldenRatio^(-1), 0.6180339887498948],
  Axes->{True, True},
  AxesLabel->{None, None},
  AxesOrigin->{0, 0},
  DisplayFunction->Identity,
  Frame->{{False, False}, {False, False}},
  FrameLabel->{{None, None}, {None, None}},
  FrameTicks->{{Automatic, Automatic}, {Automatic, Automatic}},
  GridLines->{None, None},
  GridLinesStyle->Directive[
    GrayLevel[0.5, 0.4]],
  Method->{},
  PlotRange->{{0., 128.}, {0, 1.3721772856417014`}},
  PlotRangeClipping->True,
  PlotRangePadding->{{
     Scaled[0.02], 
     Scaled[0.02]}, {
     Scaled[0.02], 
     Scaled[0.05]}},
  Ticks->{Automatic, Automatic}]], "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
},
WindowSize->{952, 960},
Visible->True,
ScrollingOptions->{"VerticalScrollRange"->Fit},
ShowCellBracket->Automatic,
CellContext->Notebook,
TrackCellChangeTimes->False,
FrontEndVersion->"10.2 for Microsoft Windows (64-bit) (July 7, 2015)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[1486, 35, 48, 0, 90, "Title"],
Cell[1537, 37, 76, 0, 30, "Text"],
Cell[CellGroupData[{
Cell[1638, 41, 38, 0, 63, "Section"],
Cell[CellGroupData[{
Cell[1701, 45, 317, 9, 52, "Input"],
Cell[2021, 56, 591, 15, 31, "Output"]
}, Open  ]],
Cell[2627, 74, 4478, 105, 452, "Input"],
Cell[CellGroupData[{
Cell[7130, 183, 826, 20, 72, "Input"],
Cell[7959, 205, 15892, 340, 255, "Output"]
}, Open  ]],
Cell[CellGroupData[{
Cell[23888, 550, 1204, 29, 132, "Input"],
Cell[25095, 581, 244914, 4221, 2156, "Output"]
}, Open  ]]
}, Open  ]],
Cell[CellGroupData[{
Cell[270058, 4808, 37, 0, 63, "Section"],
Cell[270098, 4810, 485, 14, 52, "Input"],
Cell[CellGroupData[{
Cell[270608, 4828, 90, 1, 31, "Input"],
Cell[270701, 4831, 88, 2, 31, "Output"]
}, Open  ]],
Cell[270804, 4836, 281, 7, 31, "Input"],
Cell[CellGroupData[{
Cell[271110, 4847, 136, 3, 31, "Input"],
Cell[271249, 4852, 2038, 44, 243, "Output"]
}, Open  ]],
Cell[273302, 4899, 329, 9, 31, "Input"],
Cell[CellGroupData[{
Cell[273656, 4912, 140, 3, 31, "Input"],
Cell[273799, 4917, 2016, 44, 243, "Output"]
}, Open  ]],
Cell[275830, 4964, 241, 6, 31, "Input"],
Cell[CellGroupData[{
Cell[276096, 4974, 148, 3, 31, "Input"],
Cell[276247, 4979, 2024, 44, 243, "Output"]
}, Open  ]]
}, Open  ]]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature Cx0kBrSsl1nvzB17WjETcN1h *)
