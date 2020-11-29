## Snowboard
The main idea finding the flag using multiple forensics techniques.


#### Step-1:
After we download `Snowboard.jpg`, we try to open and see the flag and check if we find any.

<img src="Snowboard.jpg">

#### Step-2:
I tried simple techniques and easily found answer when we send the command:

`strings Snowboard.jpg | grep {`

We get a false flag `CTFlearn{CTFIsEasy!!!}` which is not the correct flag.

So we try harder.

#### Step-3:
We use the following command to extract all the enclosed zipped images.
`binwalk -D='.*' Snowboard.jpg`

We get a new directory `_Snowboard.jpg.extracted`

In that directory, we get some files like `0`, `3A4`, `5A`, `393B` & `395B`.

#### Step-4:
We try different commands `strings <file_name> | grep {`.

But after some tries, I tried command `strings -n 8 0` and got this as output:

```bash
CTFlearn{CTFIsEasy!!!}
Q1RGbGVhcm57U2tpQmFuZmZ9Cg==
Canon EOS 6D Mark II
GIMP 2.10.6
2019:05:07 14:37:21
2018:08:23 12:52:08
2018:08:23 12:52:08
082051002328
EF24-105mm f/4L IS USM
0000502af2
 $.' ",#
(7),01444
'9=82<.342
!22222222222222222222222222222222222222222222222222
%&'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz
&'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz
Jps]7"rT
http://ns.adobe.com/xap/1.0/
<?xpacket begin="
" id="W5M0MpCehiHzreSzNTczkc9d"?> <x:xmpmeta xmlns:x="adobe:ns:meta/" x:xmptk="XMP Core 4.4.0-Exiv2"> <rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"> <rdf:Description rdf:about="" xmlns:iptcExt="http://iptc.org/std/Iptc4xmpExt/2008-02-29/" xmlns:xmpMM="http://ns.adobe.com/xap/1.0/mm/" xmlns:stEvt="http://ns.adobe.com/xap/1.0/sType/ResourceEvent#" xmlns:stRef="http://ns.adobe.com/xap/1.0/sType/ResourceRef#" xmlns:plus="http://ns.useplus.org/ldf/xmp/1.0/" xmlns:GIMP="http://www.gimp.org/xmp/" xmlns:aux="http://ns.adobe.com/exif/1.0/aux/" xmlns:crs="http://ns.adobe.com/camera-raw-settings/1.0/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:photoshop="http://ns.adobe.com/photoshop/1.0/" xmlns:xmp="http://ns.adobe.com/xap/1.0/" xmpMM:DocumentID="xmp.did:5745BC0FB0ABE811B17E9DE2D509CE38" xmpMM:InstanceID="xmp.iid:2a75c26f-74d2-4550-bdf1-6260a95890e8" xmpMM:OriginalDocumentID="EE719D915149C0C012BA4285EC4D4875" GIMP:API="2.0" GIMP:Platform="Windows" GIMP:TimeStamp="1557232658413988" GIMP:Version="2.10.6" aux:ApproximateFocusDistance="119/10" aux:Firmware="1.0.3" aux:FlashCompensation="0/1" aux:ImageNumber="0" aux:Lens="EF24-105mm f/4L IS USM" aux:LensID="237" aux:LensInfo="24/1 105/1 0/0 0/0" aux:LensSerialNumber="0000502af2" aux:SerialNumber="082051002328" crs:AlreadyApplied="True" crs:AutoLateralCA="0" crs:Blacks2012="-10" crs:BlueHue="0" crs:BlueSaturation="0" crs:Brightness="0" crs:CameraProfile="Embedded" crs:Clarity="0" crs:Clarity2012="+21" crs:ColorNoiseReduction="0" crs:Contrast="0" crs:Contrast2012="+5" crs:ConvertToGrayscale="False" crs:CropAngle="0" crs:CropBottom="1" crs:CropConstrainToWarp="0" crs:CropHeight="3872" crs:CropLeft="0.069159" crs:CropRight="1" crs:CropTop="0.069159" crs:CropUnit="0" crs:CropWidth="5808" crs:Defringe="0" crs:Exposure="0.00" crs:Exposure2012="+0.10" crs:FillLight="0" crs:GrainAmount="0" crs:GreenHue="0" crs:GreenSaturation="0" crs:HasCrop="True" crs:HasSettings="True" crs:HighlightRecovery="0" crs:Highlights2012="-21" crs:HueAdjustmentAqua="0" crs:HueAdjustmentBlue="0" crs:HueAdjustmentGreen="0" crs:HueAdjustmentMagenta="0" crs:HueAdjustmentOrange="0" crs:HueAdjustmentPurple="0" crs:HueAdjustmentRed="0" crs:HueAdjustmentYellow="0" crs:IncrementalTemperature="0" crs:IncrementalTint="0" crs:LensManualDistortionAmount="0" crs:LensProfileEnable="0" crs:LensProfileSetup="LensDefaults" crs:LuminanceAdjustmentAqua="0" crs:LuminanceAdjustmentBlue="0" crs:LuminanceAdjustmentGreen="0" crs:LuminanceAdjustmentMagenta="0" crs:LuminanceAdjustmentOrange="0" crs:LuminanceAdjustmentPurple="0" crs:LuminanceAdjustmentRed="0" crs:LuminanceAdjustmentYellow="0" crs:LuminanceSmoothing="0" crs:ParametricDarks="0" crs:ParametricHighlightSplit="75" crs:ParametricHighlights="0" crs:ParametricLights="0" crs:ParametricMidtoneSplit="50" crs:ParametricShadowSplit="25" crs:ParametricShadows="0" crs:PerspectiveHorizontal="0" crs:PerspectiveRotate="0.0" crs:PerspectiveScale="100" crs:PerspectiveVertical="0" crs:PostCropVignetteAmount="0" crs:ProcessVersion="6.7" crs:RedHue="0" crs:RedSaturation="0" crs:Saturation="+5" crs:SaturationAdjustmentAqua="0" crs:SaturationAdjustmentBlue="0" crs:SaturationAdjustmentGreen="0" crs:SaturationAdjustmentMagenta="0" crs:SaturationAdjustmentOrange="0" crs:SaturationAdjustmentPurple="0" crs:SaturationAdjustmentRed="0" crs:SaturationAdjustmentYellow="0" crs:ShadowTint="0" crs:Shadows="0" crs:Shadows2012="+66" crs:SharpenDetail="25" crs:SharpenEdgeMasking="0" crs:SharpenRadius="+1.0" crs:Sharpness="0" crs:SplitToningBalance="0" crs:SplitToningHighlightHue="0" crs:SplitToningHighlightSaturation="0" crs:SplitToningShadowHue="0" crs:SplitToningShadowSaturation="0" crs:ToneCurve="0, 0, 255, 255" crs:ToneCurveBlue="0, 0, 255, 255" crs:ToneCurveGreen="0, 0, 255, 255" crs:ToneCurveName="Linear" crs:ToneCurveName2012="Linear" crs:ToneCurvePV2012="0, 0, 255, 255" crs:ToneCurvePV2012Blue="0, 0, 255, 255" crs:ToneCurvePV2012Green="0, 0, 255, 255" crs:ToneCurvePV2012Red="0, 0, 255, 255" crs:ToneCurveRed="0, 0, 255, 255" crs:Version="7.0" crs:Vibrance="+15" crs:VignetteAmount="0" crs:WhiteBalance="As Shot" crs:Whites2012="0" dc:Format="image/jpeg" photoshop:DateCreated="2018-08-23T12:52:08.75" xmp:CreateDate="2018-08-23T12:52:08.75" xmp:CreatorTool="GIMP 2.10" xmp:MetadataDate="2018-08-29T14:22:51-03:00" xmp:ModifyDate="2018-08-29T14:22:51-03:00"> <iptcExt:LocationCreated> <rdf:Bag/> </iptcExt:LocationCreated> <iptcExt:LocationShown> <rdf:Bag/> </iptcExt:LocationShown> <iptcExt:ArtworkOrObject> <rdf:Bag/> </iptcExt:ArtworkOrObject> <iptcExt:RegistryId> <rdf:Bag/> </iptcExt:RegistryId> <xmpMM:History> <rdf:Seq> <rdf:li stEvt:action="derived" stEvt:parameters="saved to new location"/> <rdf:li stEvt:action="saved" stEvt:changed="/" stEvt:instanceID="xmp.iid:5745BC0FB0ABE811B17E9DE2D509CE38" stEvt:softwareAgent="Adobe Photoshop Lightroom 4.0 (Windows)" stEvt:when="2018-08-29T14:22:51-03:00"/> <rdf:li stEvt:action="saved" stEvt:changed="/" stEvt:instanceID="xmp.iid:6047bbb2-fd56-4c4c-bc52-1b0854f657ac" stEvt:softwareAgent="Gimp 2.10 (Windows)" stEvt:when="2019-05-07T14:37:38"/> </rdf:Seq> </xmpMM:History> <xmpMM:DerivedFrom stRef:documentID="EE719D915149C0C012BA4285EC4D4875" stRef:originalDocumentID="EE719D915149C0C012BA4285EC4D4875"/> <plus:ImageSupplier> <rdf:Seq/> </plus:ImageSupplier> <plus:ImageCreator> <rdf:Seq/> </plus:ImageCreator> <plus:CopyrightOwner> <rdf:Seq/> </plus:CopyrightOwner> <plus:Licensor> <rdf:Seq/> </plus:Licensor> </rdf:Description> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end="w"?>
fPhotoshop 3.0
20190507
20180823
125208+0000
143721-1437
)$+*($''-2@7-0=0''8L9=CEHIH+6OUNFT@GHE
!E.'.EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE
xj.kPDm^d
w~0@	+	 
)$R-RV-]
&6364-XE
05.jlhI$
 "02A#3@P`
A<@n]K&.M
rJ50)'J+
AQ"pa#3q
qS]=aEA(
k7f6I]G.
MS&No!F)
.ED'e8c\
CLRz?0NIQ
+4YVY6D*
'>aWL'lN
CvtB;'Ef8'q
K#	1Ok	+KN
!?[?M?U	
 !01@APQ`apq
! 10AQa@Pq`p
"""""""5
.&.qP8|Q0
R@m+O1ut
cN`VBPjTO
*1>Iors-ls
E3\@f_i^
}*T:,%t#
GHwW^YB\
```

#### Step-4:

Now we get this small Base64 encrypted message below the false flag 
`Q1RGbGVhcm57U2tpQmFuZmZ9Cg==`

When we decrypt it, we get the flag.

#### Step-5:
Finally the flag becomes:
`CTFlearn{SkiBanff}`
