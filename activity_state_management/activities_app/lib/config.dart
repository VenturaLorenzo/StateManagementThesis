int pixelsSquared = 40;
double pixelWidth = 5;
double pixelHeight = 5;
int numPoints = 100;
int interval = 25;

List<List<bool>> generatePixels(){
  return List.generate(pixelsSquared,
          (index) => List.generate(pixelsSquared, (index) => false));
}
