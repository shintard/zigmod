const std = @import("std");
const gpa = std.heap.c_allocator;
const out = std.io.getStdOut().writer();

const u = @import("./../../util/index.zig");
const aq = @import("./../aq.zig");

//
//

pub fn execute(args: [][]u8) !void {
    const url = try std.mem.join(gpa, "/", &.{ aq.server_root, args[0] });
    const val = try aq.server_fetch(url);

    try out.print("{}\n", .{val});
}
