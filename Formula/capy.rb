class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.16.6"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.16.6/capy_0.16.6_darwin_arm64.tar.gz"
      sha256 "acbfd8adeeabee10f80ce51ac2a1b25ff2113ddc18afdc29dad67a3460d1bb74"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.16.6/capy_0.16.6_linux_arm64.tar.gz"
      sha256 "d4973b55b99db9b359096849fc55534704bbc3bb948fb9461d492f337eff9a8f"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.16.6/capy_0.16.6_linux_amd64.tar.gz"
      sha256 "16b5d0d85191378afd2ce773c7adaff1c7746aec182f3848cb2eb6416c011b00"
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
