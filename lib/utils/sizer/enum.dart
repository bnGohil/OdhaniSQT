enum WorkingStatus{COMPLETED,PENDING}

enum JobStatus{ACCEPT,REJECT,PENDING,COMPLETED}

enum TypesOfApp{BOUTIQUE,AGENCY}

extension JobStatusExt on JobStatus{

  String? get jobTitle{
    switch(this){
      case JobStatus.ACCEPT:
        return "Accept";
      case JobStatus.REJECT:
        return "Reject";
      case JobStatus.PENDING:
        return "Pending";
      case JobStatus.COMPLETED:
        return "Completed";
    }
    return null;
  }



}
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