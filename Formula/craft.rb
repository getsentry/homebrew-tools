class Craft < Formula
  desc "Universal release tool"
  homepage "https://craft.sentry.dev"
  version "3.12.1"
  license "MIT"
  depends_on "git"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/craft/releases/download/3.12.1/craft-darwin-arm64.gz"
      sha256 "fcd8d6c061288eefb9e72a7da3a2120b6b2590afe063d973ea4e941febac4280"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/craft/releases/download/3.12.1/craft-darwin-x64.gz"
      sha256 "f04cf84e1071f4d26f2d2c7622fb97c1aedafeb4e60efada7ecaa8717129f699"
    else
      raise "Unsupported macOS CPU architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.12.1/craft-linux-arm64.gz"
      sha256 "dda616c8fbfbe6a1b93d9f03dd596cea4ab83f33ae9fe9d757536043d97fcfbb"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.12.1/craft-linux-x64.gz"
      sha256 "c605b7d8bbc51c928c2afe30ab42cab1a10127a1d2b18e61aae55208d71c9168"
    else
      raise "Unsupported Linux CPU architecture"
    end
  else
    raise "Unsupported operating system"
  end

  def install
    bin.install Dir["craft-*"].first => "craft"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/craft --version").chomp
  end
end
