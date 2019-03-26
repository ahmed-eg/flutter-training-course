
import 'package:sample_hr/models/base_model.dart';

class Department extends BaseModel{

  String code;
  String nameAr;
  String nameEn;
  String description;
  //    100 : HR
  @override
  String get displayName => '$code : $nameEn';

  Department({id,isActive=false, this.code, this.nameAr, this.nameEn,this.description}) 
          :super(id:id,isActive:isActive);
          
}