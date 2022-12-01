import Foundation

var data = openInputFile(input_file: "day1.txt")

class day1{
    var input_file:String
    var elves:Array<Array<Int>>
    var _sums:Array<Int>
    init(input_file:String){
        self.input_file = input_file
        self.elves = []
        self._sums = []
    }
    func open_input(){
        let file_contents = try! String(contentsOfFile: input_file).split(separator: "\n\n")
        for group in file_contents{
            elves.append(group.split(separator:"\n").map { Int($0)! })
        }
    }
    func sums(){
        open_input()
        for elf in elves{
            _sums.append(elf.reduce(0,+))
        }
    }
    func max()->Int{
        sums()
        let max = _sums.max()!
        print(max)
        return max
    }
}
