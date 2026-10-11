class Firestore2csv < Formula
  desc "Export and import Google Cloud Firestore collections as CSV files"
  homepage "https://github.com/serpro69/firestore2csv"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/firestore2csv/releases/download/v0.2.2/firestore2csv_0.2.2_darwin_arm64.tar.gz"
      sha256 "4d8ebf070f38b1ee26ec6652c9953ad8af0b082627a69dd0fa9da26e7d1c8a15"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/firestore2csv/releases/download/v0.2.2/firestore2csv_0.2.2_darwin_amd64.tar.gz"
      sha256 "ce570f1aa9f82bb1cadb84ccd61fd520bbe91fba62e5906c61ed781e616650f6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/serpro69/firestore2csv/releases/download/v0.2.2/firestore2csv_0.2.2_linux_arm64.tar.gz"
      sha256 "e36275dee9ac90dd696a8ab8d1aa30cc2976e778a95048c7d628f5e4f3e0fa67"
    elsif Hardware::CPU.intel?
      url "https://github.com/serpro69/firestore2csv/releases/download/v0.2.2/firestore2csv_0.2.2_linux_amd64.tar.gz"
      sha256 "ff3e2576d910a283686ed6b088e779349c8c2b6ff6448a81cdde78504c390ff4"
    end
  end

  def install
    bin.install "firestore2csv"
    generate_completions_from_executable(bin/"firestore2csv", shell_parameter_format: :cobra)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/firestore2csv --version")
  end
end
