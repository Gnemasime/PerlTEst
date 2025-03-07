#!/usr/bin/perl
use strict;
use warnings;

# Function to process log file and extract event details
sub process_log_file {
    my ($filename) = @_;
    
    # Open the log file for reading
    open my $fh, '<', $filename or die "Could not open '$filename' for reading: $!\n";
    
    # Initialize counters and variables to track the most recent event for each type
    my %event_count = (
        ERROR   => 0,
        WARNING => 0,
        INFO    => 0,
    );
    my %latest_event = (
        ERROR   => { timestamp => '', message => '' },
        WARNING => { timestamp => '', message => '' },
        INFO    => { timestamp => '', message => '' },
    );

    # Read each line of the log file
    while (my $line = <$fh>) {
        chomp $line;
        
        # Extract timestamp, event type, and message
        if ($line =~ /^(\S+\s+\S+)\s+(ERROR|WARNING|INFO)\s+(.*)$/) {
            my ($timestamp, $event_type, $message) = ($1, $2, $3);
            
            # Increment the event count
            $event_count{$event_type}++;
            
            # Check if this event is the most recent for its type
            if ($timestamp gt $latest_event{$event_type}->{timestamp}) {
                $latest_event{$event_type}->{timestamp} = $timestamp;
                $latest_event{$event_type}->{message} = $message;
            }
        }
    }
    
    # Close the file handle
    close $fh;
    
    # Print event counts
    foreach my $event_type (qw(INFO ERROR WARNING)) {
        print "$event_type: $event_count{$event_type} occurrences\n";
    }
    
    # Display most recent event details
    foreach my $event_type (qw(INFO WARNING ERROR)) {
        print "\nMost Recent $event_type:\n";
        print "Timestamp: $latest_event{$event_type}->{timestamp}\n";
        print "Message: $event_type $latest_event{$event_type}->{message}\n";
    }
}

# Main execution block
# Provide the log file name here
my $log_filename = 'log.txt';  # Change this to your log file path

process_log_file($log_filename);
