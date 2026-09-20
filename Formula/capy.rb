class Capy < Formula
  desc "Context-aware MCP server for LLM context reduction"
  homepage "https://github.com/serpro69/capy"
  version "0.16.3"
  license "Elastic-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.16.3/capy_0.16.3_darwin_arm64.tar.gz"
      sha256 "a4c4a4fcb28bb70efdeccb6d16057654b1ed34a5cf129061371f6c6a404f879b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/capy/releases/download/v0.16.3/capy_0.16.3_linux_arm64.tar.gz"
      sha256 "6cbf3ced9677de99193d6f7cb1156a1fd7d8a12fae4084520476f1dfea61bfec"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/capy/releases/download/v0.16.3/capy_0.16.3_linux_amd64.tar.gz"
      sha256 "b5e06d043b30171635dfba62c5b08109bfac3ddcb71551db91c89a1478169ee1"
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
