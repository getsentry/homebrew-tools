class Craft < Formula
  desc "Universal release tool"
  homepage "https://craft.sentry.dev"
  version "3.4.1"
  license "MIT"
  depends_on "git"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/craft/releases/download/3.4.1/craft-darwin-arm64.gz"
      sha256 "d56c1abc31ba4b2816a6773ec7face424a0300cdcdf94fdbfa96f35d53d9a87c"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/craft/releases/download/3.4.1/craft-darwin-x64.gz"
      sha256 "0ce6514cfa5b4fe1e02e561e1fad39d6184456451dfd4570719068a00980f036"
    else
      raise "Unsupported macOS CPU architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.4.1/craft-linux-arm64.gz"
      sha256 "49f71e3a7e9dc87444c685a8654985e2f7db5a74feb293445be8916ecd326acf"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.4.1/craft-linux-x64.gz"
      sha256 "444db7eb25751e23dbaebd182161762837abcaf6e8734a707fd7985cd0e5d86e"
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
