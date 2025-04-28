version:
builtins.getAttr version {
  "2.4.0" = {
    aarch64-darwin-cpu = {
      name = "libtorch-macos-arm64-2.4.0.zip";
      url = "https://download.pytorch.org/libtorch/cpu/libtorch-macos-arm64-2.4.0.zip";
      hash = "sha256-DiI90kaH5DZDRjKn3KiZmxpeSBQZhTrJHwrJopJtxCc=";
    };
    x86_64-linux-cpu = {
      name = "libtorch-cxx11-abi-shared-with-deps-2.4.0-cpu.zip";
      url = "https://download.pytorch.org/libtorch/cpu/libtorch-cxx11-abi-shared-with-deps-2.4.0%2Bcpu.zip";
      hash = "sha256-8V19wuY1MWaTvmqxKvr4TzUciQim0oz0N4JVMNrLyyA=";
    };
    x86_64-linux-cuda = {
      name = "libtorch-cxx11-abi-shared-with-deps-2.4.0-cu121.zip";
      url = "https://download.pytorch.org/libtorch/cu121/libtorch-cxx11-abi-shared-with-deps-2.4.0%2Bcu121.zip";
      hash = "sha256-5HfCJ970GY3iqTKQD0GN0+FOVzCvBmZb0qXxcToTBHE=";
    };
  };
}
