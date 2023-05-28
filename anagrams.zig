const std = @import("std");
const mem = std.mem;
const Allocator = std.mem.Allocator;

fn completeAnagrams(start: []u8, end: []u8, allocator: Allocator) void {
    var i: usize = 1;
    //var front: []u8 = allocator.alloc(u8, start.len + 1) catch unreachable;
    //var back: []u8 = allocator.alloc(u8, end.len - 1) catch unreachable;
    if (end.len > 0) {
        while (i < end.len) : (i += 1) {
            //var front: []u8 = mem.copy(u8, start);
            //var front_slices = { start[0..], end[i - 1] };
            //var back_slices = { end[0 .. i - 1], end[i..end.len] };
            //var front: [start.len + 1]u8 = undefined;
            //var back: [end.len - 1]u8 = undefined;
            var front: []u8 = allocator.alloc(u8, start.len + 1) catch unreachable;
            var back: []u8 = allocator.alloc(u8, end.len - 1) catch unreachable;
            mem.copy(u8, front[0..start.len], start[0..start.len]);
            mem.copy(u8, front[start.len .. start.len + 1], end[i - 1 .. i]);
            mem.copy(u8, back[0 .. i - 1], end[0 .. i - 1]);
            mem.copy(u8, back[i - 1 .. end.len - 1], end[i..end.len]);
            //try std.io.getStdOut().writer().print("{s}\n", .{back});
            completeAnagrams(front, back, allocator);
            allocator.free(front);
            allocator.free(back);
        }
        var front: []u8 = allocator.alloc(u8, start.len + 1) catch unreachable;
        var back: []u8 = allocator.alloc(u8, end.len - 1) catch unreachable;
        mem.copy(u8, front[0..start.len], start[0..start.len]);
        mem.copy(u8, front[start.len .. start.len + 1], end[end.len - 1 .. end.len]);
        mem.copy(u8, back[0 .. end.len - 1], end[0 .. end.len - 1]);
        completeAnagrams(front, back, allocator);
        allocator.free(front);
        allocator.free(back);
    } else {
        //std.io.getStdOut().writer().print("{s}\n", .{start}) catch unreachable;
    }
    //allocator.free(front);
    //allocator.free(back);
}

pub fn main() void {
    //var args = "abc".*;
    //try std.io.getStdOut().writer().print("{s}\n", .{std.os.argv[1]});
    //var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    //const allocator = gpa.allocator();
    const allocator = std.heap.c_allocator;
    //var args = std.process.argsWithAllocator(allocator);
    const args = std.os.argv;

    completeAnagrams("", args.ptr[1][0..std.mem.len(args.ptr[1])], allocator);
}
