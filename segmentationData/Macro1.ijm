run("Bio-Formats Importer", "open=/data/segmentation/segmentationData/demo.oib " +
  "autoscale color_mode=Grayscale view=Hyperstack stack_order=XYCZT");
run("Duplicate...", "duplicate channels=2 slices=4");
run("Gaussian Blur...", "sigma=1");
saveAs("Tiff", "/data/segmentation/segmentationData/demo-1.tif");
selectWindow("demo.oib");
run("Duplicate...", "duplicate channels=2 slices=5");
run("Gaussian Blur...", "sigma=1");
//setTool("polygon");
saveAs("Tiff", "/data/segmentation/segmentationData/demo-2.tif");
makePolygon(281,123,375,96,420,84,507,80,593,99,680,136,767,203,852,285,867,348,785,460,736,509,619,563,517,628,436,709,388,751,275,721,147,645,75,543,64,407,95,297,165,204,249,141);
run("ROI Manager...");
roiManager("Add");
roiManager("Save", "/data/segmentation/segmentationData/0415-0465.roi");
selectWindow("demo-1.tif");
run("Interactive H_Watershed", "hmin_=0.0 thresh_=156.0 peakflooding=100.0 allowsplitting=true displaystyle=Image imagetodisplayname=demo-1.tif outputmask=false");
setOption("ScaleConversions", false);
run("H_Watershed", "impin=[demo-1.tif] hmin=30.0 thresh=500.0 peakflooding=90.0 outputmask=true allowsplitting=true");
