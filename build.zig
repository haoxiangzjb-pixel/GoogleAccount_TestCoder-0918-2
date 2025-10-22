const std = @import("std");

// Although we could generate a random name, it's more practical to use a standard name like "build.zig"
// However, as per your request, I'll create a version with a randomly named file as well

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // Define the executable
    const exe = b.addExecutable(.{
        .name = "hello",
        .root_source_file = b.path("hello.zig"),
        .target = target,
        .optimize = optimize,
    });

    // Add the executable to the installation step
    b.installArtifact(exe);

    // Create a run step for convenience
    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());

    const run_step = b.step("run", "Run the application");
    run_step.dependOn(&run_cmd.step);
}