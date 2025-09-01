class SentryCli < Formula
  desc "Sentry command-line client for some generic tasks"
  homepage "https://github.com/getsentry/sentry-cli"
  version "2.53.0"
  license "BSD-3-Clause"
  if OS.mac?
    url "https://downloads.sentry-cdn.com/sentry-cli/2.53.0/sentry-cli-Darwin-universal"
    sha256 "d4de5a7c75d970970742daf0d1d489a42e40e11a88bb22552d5c532ce97e4025"
  elsif OS.linux?
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.53.0/sentry-cli-Linux-aarch64"
        sha256 "a895f1f4adf3641d43ea98f869e46216159e26992dc3a9d2f60728eede143e02"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.53.0/sentry-cli-Linux-armv7"
        sha256 "305735b535f6c911b99141825654a5cc8c26b749563edb4d9ac6d0328117d47a"
      end
    elseif Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://downloads.sentry-cdn.com/sentry-cli/2.53.0/sentry-cli-Linux-x86_64"
        sha256 "2fe957bc8f2eccdfde5fd78ebf86ddf66b589e92b9dd40b54ec99cce3fd469e4"
      else
        url "https://downloads.sentry-cdn.com/sentry-cli/2.53.0/sentry-cli-Linux-i686"
        sha256 "fcfcb458ee3819b050072bbc6badfee0eaaea08964a35351429431d5dccdeab4"
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
