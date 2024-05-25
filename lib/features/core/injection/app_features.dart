import 'package:got_app/features/core/injection/injection_feature.dart';
import 'package:got_app/features/houses_list/di/houses_list_di.dart';

final List<InjectionFeature> appInjectionFeatures = <InjectionFeature>[
  ..._injectionFeatures,
];

final List<InjectionFeature> _injectionFeatures = <InjectionFeature>[
  HousesListFeature(),
];