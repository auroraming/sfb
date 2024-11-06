/**
 *  Copyright (C) 2018-2024

 */
enum MaskForCameraViewCameraDescription { front, rear }
enum MaskForCameraViewBorderType { solid, dotted }
enum MaskForCameraViewInsideLineDirection { horizontal, vertical }

enum MaskForCameraViewInsideLinePosition {
  partOne,
  partTwo,
  partThree,
  partFour,
  center,
  endPartFour,
  endPartThree,
  endPartTwo,
  endPartOne
}
class MaskForCameraViewInsideLine {
  MaskForCameraViewInsideLine({this.direction, this.position});
  MaskForCameraViewInsideLineDirection? direction;
  MaskForCameraViewInsideLinePosition? position;
}
