class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.3.1"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.3.1/capy_0.3.1_darwin_arm64.tar.gz"
      sha256 "f20b82c912dc11b5b976151ea47dd7af2c5cc9380aeccbf5877a6083fdaf0771"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.3.1/capy_0.3.1_linux_arm64.tar.gz"
      sha256 "f289943ca2c730f7abedec514e37e3e4a739297225bbf0fba23309391a159c92"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.3.1/capy_0.3.1_linux_amd64.tar.gz"
      sha256 "52810ca655ddc5a27f069c0995ab050d7cfa5a2f9b718a13346b9f14fed3eb96"
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
