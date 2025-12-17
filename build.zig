const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addLibrary(.{
        .linkage = .static,
        .name = "toml",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/toml.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });
    b.installArtifact(lib);

    const main_tests = b.addTest(.{
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/toml.zig"),
            .target = target,
            .optimize = optimize,
        }),
    });

    main_tests.linkSystemLibrary("c");

    const run_test_cmd = b.addRunArtifact(main_tests);
    run_test_cmd.has_side_effects = true;
    run_test_cmd.step.dependOn(b.getInstallStep());

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&run_test_cmd.step);
}