class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "1.77.2"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/1.77.2/sentry-cli-Darwin-universal"
    sha256 "88648343df5e7e6bbf7e95fb8c67681b7949fdc919c00c0acaedf2ac8e258acc"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.77.2/sentry-cli-Linux-aarch64"
        sha256 "62f023ef7741facc7d4faead1717840aa83572991f9bcf42172b0ad82f27a820"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.77.2/sentry-cli-Linux-armv7"
        sha256 "23570b65e0c31428914d388b8e5e7ffb499627af810f60965517148cce0ac6fc"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/1.77.2/sentry-cli-Linux-x86_64"
        sha256 "088ac6568445c4ebb5b82652190f51c711e13d40d5bd94a62cc37f2f1865412d"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/1.77.2/sentry-cli-Linux-i686"
        sha256 "a8e77f18ddadb5035d1c54b5978d7528b87fda62804a19a272f21761cdd0c889"
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
