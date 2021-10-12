//i need to creater project that has fasionlist to add and remover

import Foundation

enum Priority {
    case low
    case med
    case high
}

enum TaskStatus {
    case completed
    case pending
}
enum Days{
    case Sat
    case Sun
    case Mon
    case Tue
    case Wed
    case Thu
    case Fri
}

struct TaskItem {
    
    var title : String
    var note : String
    var time : Int
    var day : Days
    var pririty: Priority
    var taskStatus: TaskStatus
}

struct List {
    var listTitle : String
    var items : [TaskItem]
    
    mutating func addItem (item: TaskItem ){
        self.items.append(item)
    }
}

class ToDoList {
    var wasaifList: [List]
    
    init() {
        wasaifList = []
    }
    
    init(wasaifList: List) {
        self.wasaifList = [wasaifList]
    }
    
    func removeAll() {
        self.wasaifList.removeAll()
    }
    

    func addList (added : List ){
        self.wasaifList.append(added)
        
    }
    
    func changesList (changes : TaskItem , listIndex : Int, itemIndex: Int){
        self.wasaifList[listIndex].items[itemIndex] = changes

    }
    
    func deletList(listIndex: Int, itemIndex: Int ){
        self.wasaifList[listIndex].items.remove(at: itemIndex)
        
    }
    //read
    func Tasks() {
        for item in wasaifList {
            print(item.listTitle)
        
            for task in item.items {
                print(task.title, task.time,task.day, task.note, task.pririty, task.taskStatus)
                
            }
            
        }
    }
}

var task1 = TaskItem(title: "HW", note: "doing now", time: 8, day: .Sat, pririty: .med, taskStatus: .pending)
var task2 = TaskItem(title: "Call", note: "Daily", time: 10, day: .Fri, pririty: .high, taskStatus: .completed)
var task3 = TaskItem(title: "Medicine", note: "now", time: 22, day: .Mon, pririty: .high, taskStatus: .pending)

var task4 = TaskItem(title: "appointment", note: "Dentist appointment", time: 9, day: .Sat, pririty: .med, taskStatus: .pending)
var task5 = TaskItem(title: "call salim", note: "coding", time: 9, day: .Sat, pririty: .med, taskStatus: .pending)
var task6 = TaskItem(title: "visit", note: "visit mum", time: 6, day: .Sun, pririty: .med, taskStatus: .completed)
var task7 = TaskItem(title: "watch", note: "film", time: 7, day: .Fri, pririty: .med, taskStatus: .pending)
var task8 = TaskItem(title: "call hanan", note: "go out with me", time: 6, day: .Sun, pririty: .low, taskStatus: .completed)
var myList2 = List(listTitle: "MyList2", items: [task7,task8])

var myList = List(listTitle: "MyList", items: [task1, task2,task3,task4])
myList.addItem(item: task5)

var newTask = ToDoList()
newTask.addList(added: myList)
newTask.addList(added: myList2)

newTask.changesList(changes: task6 , listIndex: 0, itemIndex: 0)
newTask.Tasks()




