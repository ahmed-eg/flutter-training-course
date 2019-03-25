
import 'package:sample_hr/models/base_model.dart';

class Department extends BaseModel{

  String code;
  String nameAr;
  String nameEn;
  
  //    100 : HR
  @override
  String get displayName => '$code : $nameEn';

  Department({id,isActive, this.code, this.nameAr, this.nameEn}) 
          :super(id:id,isActive:isActive);
          
}