class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.14.1"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.14.1/capy_0.14.1_darwin_arm64.tar.gz"
      sha256 "54cfc65079ec7a5acd175407852fdd7d4502b0ae16262ae8edc5387ad6337255"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.14.1/capy_0.14.1_linux_arm64.tar.gz"
      sha256 "bdf79b021392e64a4dda7327dcd99364e025a6c56886de8f5bd9a6eef748916b"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.14.1/capy_0.14.1_linux_amd64.tar.gz"
      sha256 "483881f25da01d9c53142329f167377fdc90857f38971ca15c85b702c6d1bb16"
    end
  end

  def install
    bin.install "capy"
    generate_completions_from_executable(bin/"capy", shell_parameter_format: :cobra)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/capy --version")
  end
end
