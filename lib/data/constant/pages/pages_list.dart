import '../../../views/cargo/view/cargo_view.dart';
import '../../../views/category_module/service_page/view/service_wear_view.dart';
import '../../../views/category_module/staff_page/view/staff_task_clothing_view.dart';
import '../../../views/category_module/training_page/view/training_clothing_view.dart';
import '../../../views/home/view/home_view.dart';
import '../../../views/period/view/ration_request_period_view.dart';
import '../../../views/size/view/size_info.dart';

class PagesList {
  static get pagesList {
    return [
      HomeView(), // 0
      const CargoView(), // 1
      const SizeInfoView(), // 2
      const RationRequestPeriodView(), // 3
      ServiceWearView(), // 4
      TrainingClothingView(), // 5
      StaffTaskClothingView(), // 6
    ];
  }
}
