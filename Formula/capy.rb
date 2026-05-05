class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.6.2"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.6.2/capy_0.6.2_darwin_arm64.tar.gz"
      sha256 "fcd0d9283e7cd989aa86802d4a5ae20e1cce8c109af3825c5d466c98f15959ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.6.2/capy_0.6.2_linux_arm64.tar.gz"
      sha256 "9bb539274a64b517d37cead9e4adafe0069b8b28e19e7272cd33928d1bee46f0"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.6.2/capy_0.6.2_linux_amd64.tar.gz"
      sha256 "bcfd680be1f69a069b9d1b82dffc84ee8c9794e038c65baece270923fb620273"
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
