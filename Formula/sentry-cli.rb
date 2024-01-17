class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.25.2"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.25.2/sentry-cli-Darwin-universal"
    sha256 "e723cbd3e5a058f15e66abcce4dead885f217c8270af5ca26b9809ee7669a9a1"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.25.2/sentry-cli-Linux-aarch64"
        sha256 "5461cf339976bc3f03ced7483ef63d81163b521c9aa17e0dd7bdf44f1f429ff4"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.25.2/sentry-cli-Linux-armv7"
        sha256 "d54cb179a04785740cde482275557f0db943170bd5810db918d9e4d20c12c646"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.25.2/sentry-cli-Linux-x86_64"
        sha256 "f9987b4420d3980cc3120d4e90d6fb9b5a400c0b881f326c61d373572abb4d7b"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.25.2/sentry-cli-Linux-i686"
        sha256 "c0c0bb1bf00da82fb064ed2effba7c77edbfb30911d40e64e559b785ea6a6d21"
      end
    else
      raise "Unsupported architecture"
    end
  else
      raise "Unsupported operating system"
  end
  def install
    bin.install Dir["sentry-cli-*"].first => "sentry-cli"
  end
  test do
    assert_match version.to_s, shell_output("#{bin}/sentry-cli --version").chomp
  end
end
