class Todo{
  String? todoDate;
  String? description;
  int?  id;
  String? category;
  String? title;
  todoMapp(){
    var mapping1 = Map<String, dynamic>();
    mapping1["id"]=id;
    mapping1["todoDate"]=todoDate;
    mapping1["description"]=description;
    mapping1["category"]=category;
    mapping1["title"]=title;
    return mapping1;
  }
}