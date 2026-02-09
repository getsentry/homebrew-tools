class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "3.2.0"
  license "FSL-1.1-MIT"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/3.2.0/sentry-cli-Darwin-universal"
    sha256 "a18195af49db6ea455a0d785b5bd392fb8df6f2eaf0078528c6b4653b4ce5799"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.2.0/sentry-cli-Linux-aarch64"
        sha256 "e92b176153f3729b2b4b0d41b9b523df6ebbd49378b45fbbc008052042460f96"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.2.0/sentry-cli-Linux-armv7"
        sha256 "9cde058201958bc53c1ba4deb67fcb76970084522cd5e980ea16791b21757c31"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/3.2.0/sentry-cli-Linux-x86_64"
        sha256 "cb82525102b8ad9a300bfb55afa3dc2d9ab275caf1dcbfdf431fc11fdf13136f"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/3.2.0/sentry-cli-Linux-i686"
        sha256 "5e08f47c358ee6592bea2a6854a722d7a5512c879e7a0440897e882fdb5b496c"
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
