class Craft < Formula
  desc "Universal release tool"
  homepage "https://craft.sentry.dev"
  version "3.10.0"
  license "MIT"
  depends_on "git"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/craft/releases/download/3.10.0/craft-darwin-arm64.gz"
      sha256 "6b9bf644d1e218be6ee00c5c5ae95238cff36c2dd14073f3459b649e515a510d"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/craft/releases/download/3.10.0/craft-darwin-x64.gz"
      sha256 "a371aff85e461ae99c859b9320f077da8bc82c8a55124798336be8430bfa9e88"
    else
      raise "Unsupported macOS CPU architecture"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.10.0/craft-linux-arm64.gz"
      sha256 "ef907575b0dd47476dec160bf61461381d4b0848d9538218e771eb09b4001d73"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/craft/releases/download/3.10.0/craft-linux-x64.gz"
      sha256 "57d70d73e9815303a892c343b3fc0207f3fd0ecb4c857ffc91cffc6c4b40227c"
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
