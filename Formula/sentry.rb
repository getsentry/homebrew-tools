class Sentry < Formula
  desc "Sentry command-line tool for error monitoring and debugging"
  homepage "https://cli.sentry.dev"
  version "0.49.0"
  license "FSL-1.1-Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/getsentry/toolkit/releases/download/cli@0.49.0/sentry-darwin-arm64.gz"
      sha256 "40ddc80ecfd3da4bb106a9199734f9e07baa7bcc03d945f6ec2ac4ee10714bb6"
    elsif Hardware::CPU.intel?
      url "https://github.com/getsentry/toolkit/releases/download/cli@0.49.0/sentry-darwin-x64.gz"
      sha256 "ba44f32bdc2fbfe40b139fb201f40ba116191239b339e20191f0890a824c8f6c"
    else
      raise "Unsupported macOS CPU architecture: #{Hardware::CPU.type}"
    end
  elsif OS.linux?
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/toolkit/releases/download/cli@0.49.0/sentry-linux-arm64.gz"
      sha256 "776711626b059d13d4bf319d2982b6fa60f406b562dd02b8d0645c7fe9c394e7"
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/getsentry/toolkit/releases/download/cli@0.49.0/sentry-linux-x64.gz"
      sha256 "e8eede9626bc07cfd880ee21c2ab6d86ad979f61583ca18c5ccedd10668c6e81"
    else
      raise "Unsupported Linux CPU architecture: #{Hardware::CPU.type} (only 64-bit arm and x86_64 are supported)"
    end
  else
    raise "Unsupported operating system"
  end

  def install
    bin.install Dir["sentry-*"].first => "sentry"
    # The release asset is a bare gzip, so the unpacked binary has no
    # exec bit. Homebrew's cleaner only fixes that after `install`.
    chmod 0755, bin/"sentry"
    # Homebrew-managed completion dirs survive the build sandbox and
    # are cleaned up by `brew uninstall`. Writing into $HOME from
    # post_install does not work: it runs under a throwaway HOME.
    generate_completions_from_executable(bin/"sentry", "cli", "completion")
  end

  def caveats
    <<~EOS
      Shell completions for bash, zsh, and fish are installed by Homebrew.

      To install the Sentry CLI skill for detected AI coding agents, run:
        sentry cli setup --no-modify-path --no-completions

      `sentry cli upgrade` refreshes the skill automatically. After a
      `brew upgrade`, run the command above again.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/sentry --version").chomp
  end
end
