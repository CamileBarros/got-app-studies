import 'package:got_app/features/core/injection/injection_feature.dart';
import 'package:got_app/features/houses_list/di/got_houses_list_di.dart';

final List<InjectionFeature> allDependencyFeatures = <InjectionFeature>[
  ..._features,
];

final List<InjectionFeature> _features = <InjectionFeature>[
  GOTHousesListFeature(),
];