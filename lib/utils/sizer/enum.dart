enum WorkingStatus{COMPLETED,PENDING}

extension WorkingStatusExt on WorkingStatus{

  String? get title {

    switch(this){

      case WorkingStatus.COMPLETED:
        return "Completed";
      case WorkingStatus.PENDING:
        return "Pending";
    }


    return null;
  }



}