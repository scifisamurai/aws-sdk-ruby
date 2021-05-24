# frozen_string_literal: true

# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing guide for more information:
# https://github.com/aws/aws-sdk-ruby/blob/version-3/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE

module Aws::ComputeOptimizer
  module Types

    # You do not have sufficient access to perform this action.
    #
    # @!attribute [rw] message
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/AccessDeniedException AWS API Documentation
    #
    class AccessDeniedException < Struct.new(
      :message)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes the configuration of an Auto Scaling group.
    #
    # @!attribute [rw] desired_capacity
    #   The desired capacity, or number of instances, for the Auto Scaling
    #   group.
    #   @return [Integer]
    #
    # @!attribute [rw] min_size
    #   The minimum size, or minimum number of instances, for the Auto
    #   Scaling group.
    #   @return [Integer]
    #
    # @!attribute [rw] max_size
    #   The maximum size, or maximum number of instances, for the Auto
    #   Scaling group.
    #   @return [Integer]
    #
    # @!attribute [rw] instance_type
    #   The instance type for the Auto Scaling group.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/AutoScalingGroupConfiguration AWS API Documentation
    #
    class AutoScalingGroupConfiguration < Struct.new(
      :desired_capacity,
      :min_size,
      :max_size,
      :instance_type)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes an Auto Scaling group recommendation.
    #
    # @!attribute [rw] account_id
    #   The AWS account ID of the Auto Scaling group.
    #   @return [String]
    #
    # @!attribute [rw] auto_scaling_group_arn
    #   The Amazon Resource Name (ARN) of the Auto Scaling group.
    #   @return [String]
    #
    # @!attribute [rw] auto_scaling_group_name
    #   The name of the Auto Scaling group.
    #   @return [String]
    #
    # @!attribute [rw] finding
    #   The finding classification of the Auto Scaling group.
    #
    #   Findings for Auto Scaling groups include:
    #
    #   * <b> <code>NotOptimized</code> </b>—An Auto Scaling group is
    #     considered not optimized when AWS Compute Optimizer identifies a
    #     recommendation that can provide better performance for your
    #     workload.
    #
    #   * <b> <code>Optimized</code> </b>—An Auto Scaling group is
    #     considered optimized when Compute Optimizer determines that the
    #     group is correctly provisioned to run your workload based on the
    #     chosen instance type. For optimized resources, Compute Optimizer
    #     might recommend a new generation instance type.
    #   @return [String]
    #
    # @!attribute [rw] utilization_metrics
    #   An array of objects that describe the utilization metrics of the
    #   Auto Scaling group.
    #   @return [Array<Types::UtilizationMetric>]
    #
    # @!attribute [rw] look_back_period_in_days
    #   The number of days for which utilization metrics were analyzed for
    #   the Auto Scaling group.
    #   @return [Float]
    #
    # @!attribute [rw] current_configuration
    #   An array of objects that describe the current configuration of the
    #   Auto Scaling group.
    #   @return [Types::AutoScalingGroupConfiguration]
    #
    # @!attribute [rw] recommendation_options
    #   An array of objects that describe the recommendation options for the
    #   Auto Scaling group.
    #   @return [Array<Types::AutoScalingGroupRecommendationOption>]
    #
    # @!attribute [rw] last_refresh_timestamp
    #   The time stamp of when the Auto Scaling group recommendation was
    #   last refreshed.
    #   @return [Time]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/AutoScalingGroupRecommendation AWS API Documentation
    #
    class AutoScalingGroupRecommendation < Struct.new(
      :account_id,
      :auto_scaling_group_arn,
      :auto_scaling_group_name,
      :finding,
      :utilization_metrics,
      :look_back_period_in_days,
      :current_configuration,
      :recommendation_options,
      :last_refresh_timestamp)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes a recommendation option for an Auto Scaling group.
    #
    # @!attribute [rw] configuration
    #   An array of objects that describe an Auto Scaling group
    #   configuration.
    #   @return [Types::AutoScalingGroupConfiguration]
    #
    # @!attribute [rw] projected_utilization_metrics
    #   An array of objects that describe the projected utilization metrics
    #   of the Auto Scaling group recommendation option.
    #
    #   <note markdown="1"> The `Cpu` and `Memory` metrics are the only projected utilization
    #   metrics returned. Additionally, the `Memory` metric is returned only
    #   for resources that have the unified CloudWatch agent installed on
    #   them. For more information, see [Enabling Memory Utilization with
    #   the CloudWatch Agent][1].
    #
    #    </note>
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent
    #   @return [Array<Types::UtilizationMetric>]
    #
    # @!attribute [rw] performance_risk
    #   The performance risk of the Auto Scaling group configuration
    #   recommendation.
    #
    #   Performance risk indicates the likelihood of the recommended
    #   instance type not meeting the resource needs of your workload.
    #   Compute Optimizer calculates an individual performance risk score
    #   for each specification of the recommended instance, including CPU,
    #   memory, EBS throughput, EBS IOPS, disk throughput, disk IOPS,
    #   network throughput, and network PPS. The performance risk of the
    #   recommended instance is calculated as the maximum performance risk
    #   score across the analyzed resource specifications.
    #
    #   The value ranges from 0 to 5, with 0 meaning that the recommended
    #   resource is predicted to always provide enough hardware capability.
    #   The higher the performance risk is, the more likely you should
    #   validate whether the recommended resource meets the performance
    #   requirements of your workload before migrating your resource.
    #   @return [Float]
    #
    # @!attribute [rw] rank
    #   The rank of the Auto Scaling group recommendation option.
    #
    #   The top recommendation option is ranked as `1`.
    #   @return [Integer]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/AutoScalingGroupRecommendationOption AWS API Documentation
    #
    class AutoScalingGroupRecommendationOption < Struct.new(
      :configuration,
      :projected_utilization_metrics,
      :performance_risk,
      :rank)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass DescribeRecommendationExportJobsRequest
    #   data as a hash:
    #
    #       {
    #         job_ids: ["JobId"],
    #         filters: [
    #           {
    #             name: "ResourceType", # accepts ResourceType, JobStatus
    #             values: ["FilterValue"],
    #           },
    #         ],
    #         next_token: "NextToken",
    #         max_results: 1,
    #       }
    #
    # @!attribute [rw] job_ids
    #   The identification numbers of the export jobs to return.
    #
    #   An export job ID is returned when you create an export using the
    #   `ExportAutoScalingGroupRecommendations` or
    #   `ExportEC2InstanceRecommendations` actions.
    #
    #   All export jobs created in the last seven days are returned if this
    #   parameter is omitted.
    #   @return [Array<String>]
    #
    # @!attribute [rw] filters
    #   An array of objects that describe a filter to return a more specific
    #   list of export jobs.
    #   @return [Array<Types::JobFilter>]
    #
    # @!attribute [rw] next_token
    #   The token to advance to the next page of export jobs.
    #   @return [String]
    #
    # @!attribute [rw] max_results
    #   The maximum number of export jobs to return with a single request.
    #
    #   To retrieve the remaining results, make another request with the
    #   returned `NextToken` value.
    #   @return [Integer]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/DescribeRecommendationExportJobsRequest AWS API Documentation
    #
    class DescribeRecommendationExportJobsRequest < Struct.new(
      :job_ids,
      :filters,
      :next_token,
      :max_results)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] recommendation_export_jobs
    #   An array of objects that describe recommendation export jobs.
    #   @return [Array<Types::RecommendationExportJob>]
    #
    # @!attribute [rw] next_token
    #   The token to use to advance to the next page of export jobs.
    #
    #   This value is null when there are no more pages of export jobs to
    #   return.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/DescribeRecommendationExportJobsResponse AWS API Documentation
    #
    class DescribeRecommendationExportJobsResponse < Struct.new(
      :recommendation_export_jobs,
      :next_token)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes a filter that returns a more specific list of Amazon Elastic
    # Block Store (Amazon EBS) volume recommendations. Use this filter with
    # the `GetEBSVolumeRecommendations` action.
    #
    # You can use `LambdaFunctionRecommendationFilter` with the
    # `GetLambdaFunctionRecommendations` action, `JobFilter` with the
    # `DescribeRecommendationExportJobs` action, and `Filter` with the
    # `GetAutoScalingGroupRecommendations` and
    # `GetEC2InstanceRecommendations` actions.
    #
    # @note When making an API call, you may pass EBSFilter
    #   data as a hash:
    #
    #       {
    #         name: "Finding", # accepts Finding
    #         values: ["FilterValue"],
    #       }
    #
    # @!attribute [rw] name
    #   The name of the filter.
    #
    #   Specify `Finding` to return recommendations with a specific finding
    #   classification (e.g., `NotOptimized`).
    #   @return [String]
    #
    # @!attribute [rw] values
    #   The value of the filter.
    #
    #   The valid values are `Optimized`, or `NotOptimized`.
    #   @return [Array<String>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/EBSFilter AWS API Documentation
    #
    class EBSFilter < Struct.new(
      :name,
      :values)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes a utilization metric of an Amazon Elastic Block Store
    # (Amazon EBS) volume.
    #
    # Compare the utilization metric data of your resource against its
    # projected utilization metric data to determine the performance
    # difference between your current resource and the recommended option.
    #
    # @!attribute [rw] name
    #   The name of the utilization metric.
    #
    #   The following utilization metrics are available:
    #
    #   * `VolumeReadOpsPerSecond` - The completed read operations per
    #     second from the volume in a specified period of time.
    #
    #     Unit: Count
    #
    #   * `VolumeWriteOpsPerSecond` - The completed write operations per
    #     second to the volume in a specified period of time.
    #
    #     Unit: Count
    #
    #   * `VolumeReadBytesPerSecond` - The bytes read per second from the
    #     volume in a specified period of time.
    #
    #     Unit: Bytes
    #
    #   * `VolumeWriteBytesPerSecond` - The bytes written to the volume in a
    #     specified period of time.
    #
    #     Unit: Bytes
    #   @return [String]
    #
    # @!attribute [rw] statistic
    #   The statistic of the utilization metric.
    #
    #   The Compute Optimizer API, AWS Command Line Interface (AWS CLI), and
    #   SDKs return utilization metrics using only the `Maximum` statistic,
    #   which is the highest value observed during the specified period.
    #
    #   The Compute Optimizer console displays graphs for some utilization
    #   metrics using the `Average` statistic, which is the value of `Sum` /
    #   `SampleCount` during the specified period. For more information, see
    #   [Viewing resource recommendations][1] in the *AWS Compute Optimizer
    #   User Guide*. You can also get averaged utilization metric data for
    #   your resources using Amazon CloudWatch. For more information, see
    #   the [Amazon CloudWatch User Guide][2].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/compute-optimizer/latest/ug/viewing-recommendations.html
    #   [2]: https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html
    #   @return [String]
    #
    # @!attribute [rw] value
    #   The value of the utilization metric.
    #   @return [Float]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/EBSUtilizationMetric AWS API Documentation
    #
    class EBSUtilizationMetric < Struct.new(
      :name,
      :statistic,
      :value)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass ExportAutoScalingGroupRecommendationsRequest
    #   data as a hash:
    #
    #       {
    #         account_ids: ["AccountId"],
    #         filters: [
    #           {
    #             name: "Finding", # accepts Finding, FindingReasonCodes, RecommendationSourceType
    #             values: ["FilterValue"],
    #           },
    #         ],
    #         fields_to_export: ["AccountId"], # accepts AccountId, AutoScalingGroupArn, AutoScalingGroupName, Finding, UtilizationMetricsCpuMaximum, UtilizationMetricsMemoryMaximum, UtilizationMetricsEbsReadOpsPerSecondMaximum, UtilizationMetricsEbsWriteOpsPerSecondMaximum, UtilizationMetricsEbsReadBytesPerSecondMaximum, UtilizationMetricsEbsWriteBytesPerSecondMaximum, UtilizationMetricsDiskReadOpsPerSecondMaximum, UtilizationMetricsDiskWriteOpsPerSecondMaximum, UtilizationMetricsDiskReadBytesPerSecondMaximum, UtilizationMetricsDiskWriteBytesPerSecondMaximum, UtilizationMetricsNetworkInBytesPerSecondMaximum, UtilizationMetricsNetworkOutBytesPerSecondMaximum, UtilizationMetricsNetworkPacketsInPerSecondMaximum, UtilizationMetricsNetworkPacketsOutPerSecondMaximum, LookbackPeriodInDays, CurrentConfigurationInstanceType, CurrentConfigurationDesiredCapacity, CurrentConfigurationMinSize, CurrentConfigurationMaxSize, CurrentOnDemandPrice, CurrentStandardOneYearNoUpfrontReservedPrice, CurrentStandardThreeYearNoUpfrontReservedPrice, CurrentVCpus, CurrentMemory, CurrentStorage, CurrentNetwork, RecommendationOptionsConfigurationInstanceType, RecommendationOptionsConfigurationDesiredCapacity, RecommendationOptionsConfigurationMinSize, RecommendationOptionsConfigurationMaxSize, RecommendationOptionsProjectedUtilizationMetricsCpuMaximum, RecommendationOptionsProjectedUtilizationMetricsMemoryMaximum, RecommendationOptionsPerformanceRisk, RecommendationOptionsOnDemandPrice, RecommendationOptionsStandardOneYearNoUpfrontReservedPrice, RecommendationOptionsStandardThreeYearNoUpfrontReservedPrice, RecommendationOptionsVcpus, RecommendationOptionsMemory, RecommendationOptionsStorage, RecommendationOptionsNetwork, LastRefreshTimestamp
    #         s3_destination_config: { # required
    #           bucket: "DestinationBucket",
    #           key_prefix: "DestinationKeyPrefix",
    #         },
    #         file_format: "Csv", # accepts Csv
    #         include_member_accounts: false,
    #       }
    #
    # @!attribute [rw] account_ids
    #   The IDs of the AWS accounts for which to export Auto Scaling group
    #   recommendations.
    #
    #   If your account is the management account of an organization, use
    #   this parameter to specify the member account for which you want to
    #   export recommendations.
    #
    #   This parameter cannot be specified together with the include member
    #   accounts parameter. The parameters are mutually exclusive.
    #
    #   Recommendations for member accounts are not included in the export
    #   if this parameter, or the include member accounts parameter, is
    #   omitted.
    #
    #   You can specify multiple account IDs per request.
    #   @return [Array<String>]
    #
    # @!attribute [rw] filters
    #   An array of objects that describe a filter to export a more specific
    #   set of Auto Scaling group recommendations.
    #   @return [Array<Types::Filter>]
    #
    # @!attribute [rw] fields_to_export
    #   The recommendations data to include in the export file. For more
    #   information about the fields that can be exported, see [Exported
    #   files][1] in the *Compute Optimizer User Guide*.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html#exported-files
    #   @return [Array<String>]
    #
    # @!attribute [rw] s3_destination_config
    #   An object to specify the destination Amazon Simple Storage Service
    #   (Amazon S3) bucket name and key prefix for the export job.
    #
    #   You must create the destination Amazon S3 bucket for your
    #   recommendations export before you create the export job. Compute
    #   Optimizer does not create the S3 bucket for you. After you create
    #   the S3 bucket, ensure that it has the required permission policy to
    #   allow Compute Optimizer to write the export file to it. If you plan
    #   to specify an object prefix when you create the export job, you must
    #   include the object prefix in the policy that you add to the S3
    #   bucket. For more information, see [Amazon S3 Bucket Policy for
    #   Compute Optimizer][1] in the *Compute Optimizer user guide*.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/compute-optimizer/latest/ug/create-s3-bucket-policy-for-compute-optimizer.html
    #   @return [Types::S3DestinationConfig]
    #
    # @!attribute [rw] file_format
    #   The format of the export file.
    #
    #   The only export file format currently supported is `Csv`.
    #   @return [String]
    #
    # @!attribute [rw] include_member_accounts
    #   Indicates whether to include recommendations for resources in all
    #   member accounts of the organization if your account is the
    #   management account of an organization.
    #
    #   The member accounts must also be opted in to Compute Optimizer, and
    #   trusted access for Compute Optimizer must be enabled in the
    #   organization account. For more information, see [Compute Optimizer
    #   and AWS Organizations trusted access][1] in the *AWS Compute
    #   Optimizer User Guide*.
    #
    #   Recommendations for member accounts of the organization are not
    #   included in the export file if this parameter is omitted.
    #
    #   This parameter cannot be specified together with the account IDs
    #   parameter. The parameters are mutually exclusive.
    #
    #   Recommendations for member accounts are not included in the export
    #   if this parameter, or the account IDs parameter, is omitted.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/compute-optimizer/latest/ug/security-iam.html#trusted-service-access
    #   @return [Boolean]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/ExportAutoScalingGroupRecommendationsRequest AWS API Documentation
    #
    class ExportAutoScalingGroupRecommendationsRequest < Struct.new(
      :account_ids,
      :filters,
      :fields_to_export,
      :s3_destination_config,
      :file_format,
      :include_member_accounts)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] job_id
    #   The identification number of the export job.
    #
    #   Use the `DescribeRecommendationExportJobs` action, and specify the
    #   job ID to view the status of an export job.
    #   @return [String]
    #
    # @!attribute [rw] s3_destination
    #   An object that describes the destination Amazon S3 bucket of a
    #   recommendations export file.
    #   @return [Types::S3Destination]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/ExportAutoScalingGroupRecommendationsResponse AWS API Documentation
    #
    class ExportAutoScalingGroupRecommendationsResponse < Struct.new(
      :job_id,
      :s3_destination)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes the destination of the recommendations export and metadata
    # files.
    #
    # @!attribute [rw] s3
    #   An object that describes the destination Amazon Simple Storage
    #   Service (Amazon S3) bucket name and object keys of a recommendations
    #   export file, and its associated metadata file.
    #   @return [Types::S3Destination]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/ExportDestination AWS API Documentation
    #
    class ExportDestination < Struct.new(
      :s3)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass ExportEBSVolumeRecommendationsRequest
    #   data as a hash:
    #
    #       {
    #         account_ids: ["AccountId"],
    #         filters: [
    #           {
    #             name: "Finding", # accepts Finding
    #             values: ["FilterValue"],
    #           },
    #         ],
    #         fields_to_export: ["AccountId"], # accepts AccountId, VolumeArn, Finding, UtilizationMetricsVolumeReadOpsPerSecondMaximum, UtilizationMetricsVolumeWriteOpsPerSecondMaximum, UtilizationMetricsVolumeReadBytesPerSecondMaximum, UtilizationMetricsVolumeWriteBytesPerSecondMaximum, LookbackPeriodInDays, CurrentConfigurationVolumeType, CurrentConfigurationVolumeBaselineIOPS, CurrentConfigurationVolumeBaselineThroughput, CurrentConfigurationVolumeBurstIOPS, CurrentConfigurationVolumeBurstThroughput, CurrentConfigurationVolumeSize, CurrentMonthlyPrice, RecommendationOptionsConfigurationVolumeType, RecommendationOptionsConfigurationVolumeBaselineIOPS, RecommendationOptionsConfigurationVolumeBaselineThroughput, RecommendationOptionsConfigurationVolumeBurstIOPS, RecommendationOptionsConfigurationVolumeBurstThroughput, RecommendationOptionsConfigurationVolumeSize, RecommendationOptionsMonthlyPrice, RecommendationOptionsPerformanceRisk, LastRefreshTimestamp
    #         s3_destination_config: { # required
    #           bucket: "DestinationBucket",
    #           key_prefix: "DestinationKeyPrefix",
    #         },
    #         file_format: "Csv", # accepts Csv
    #         include_member_accounts: false,
    #       }
    #
    # @!attribute [rw] account_ids
    #   The IDs of the AWS accounts for which to export Amazon EBS volume
    #   recommendations.
    #
    #   If your account is the management account of an organization, use
    #   this parameter to specify the member account for which you want to
    #   export recommendations.
    #
    #   This parameter cannot be specified together with the include member
    #   accounts parameter. The parameters are mutually exclusive.
    #
    #   Recommendations for member accounts are not included in the export
    #   if this parameter, or the include member accounts parameter, is
    #   omitted.
    #
    #   You can specify multiple account IDs per request.
    #   @return [Array<String>]
    #
    # @!attribute [rw] filters
    #   An array of objects that describe a filter to export a more specific
    #   set of Amazon EBS volume recommendations.
    #   @return [Array<Types::EBSFilter>]
    #
    # @!attribute [rw] fields_to_export
    #   The recommendations data to include in the export file. For more
    #   information about the fields that can be exported, see [Exported
    #   files][1] in the *Compute Optimizer User Guide*.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html#exported-files
    #   @return [Array<String>]
    #
    # @!attribute [rw] s3_destination_config
    #   Describes the destination Amazon Simple Storage Service (Amazon S3)
    #   bucket name and key prefix for a recommendations export job.
    #
    #   You must create the destination Amazon S3 bucket for your
    #   recommendations export before you create the export job. Compute
    #   Optimizer does not create the S3 bucket for you. After you create
    #   the S3 bucket, ensure that it has the required permission policy to
    #   allow Compute Optimizer to write the export file to it. If you plan
    #   to specify an object prefix when you create the export job, you must
    #   include the object prefix in the policy that you add to the S3
    #   bucket. For more information, see [Amazon S3 Bucket Policy for
    #   Compute Optimizer][1] in the *Compute Optimizer user guide*.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/compute-optimizer/latest/ug/create-s3-bucket-policy-for-compute-optimizer.html
    #   @return [Types::S3DestinationConfig]
    #
    # @!attribute [rw] file_format
    #   The format of the export file.
    #
    #   The only export file format currently supported is `Csv`.
    #   @return [String]
    #
    # @!attribute [rw] include_member_accounts
    #   Indicates whether to include recommendations for resources in all
    #   member accounts of the organization if your account is the
    #   management account of an organization.
    #
    #   The member accounts must also be opted in to Compute Optimizer, and
    #   trusted access for Compute Optimizer must be enabled in the
    #   organization account. For more information, see [Compute Optimizer
    #   and AWS Organizations trusted access][1] in the *AWS Compute
    #   Optimizer User Guide*.
    #
    #   Recommendations for member accounts of the organization are not
    #   included in the export file if this parameter is omitted.
    #
    #   This parameter cannot be specified together with the account IDs
    #   parameter. The parameters are mutually exclusive.
    #
    #   Recommendations for member accounts are not included in the export
    #   if this parameter, or the account IDs parameter, is omitted.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/compute-optimizer/latest/ug/security-iam.html#trusted-service-access
    #   @return [Boolean]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/ExportEBSVolumeRecommendationsRequest AWS API Documentation
    #
    class ExportEBSVolumeRecommendationsRequest < Struct.new(
      :account_ids,
      :filters,
      :fields_to_export,
      :s3_destination_config,
      :file_format,
      :include_member_accounts)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] job_id
    #   The identification number of the export job.
    #
    #   Use the `DescribeRecommendationExportJobs` action, and specify the
    #   job ID to view the status of an export job.
    #   @return [String]
    #
    # @!attribute [rw] s3_destination
    #   Describes the destination Amazon Simple Storage Service (Amazon S3)
    #   bucket name and object keys of a recommendations export file, and
    #   its associated metadata file.
    #   @return [Types::S3Destination]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/ExportEBSVolumeRecommendationsResponse AWS API Documentation
    #
    class ExportEBSVolumeRecommendationsResponse < Struct.new(
      :job_id,
      :s3_destination)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass ExportEC2InstanceRecommendationsRequest
    #   data as a hash:
    #
    #       {
    #         account_ids: ["AccountId"],
    #         filters: [
    #           {
    #             name: "Finding", # accepts Finding, FindingReasonCodes, RecommendationSourceType
    #             values: ["FilterValue"],
    #           },
    #         ],
    #         fields_to_export: ["AccountId"], # accepts AccountId, InstanceArn, InstanceName, Finding, FindingReasonCodes, LookbackPeriodInDays, CurrentInstanceType, UtilizationMetricsCpuMaximum, UtilizationMetricsMemoryMaximum, UtilizationMetricsEbsReadOpsPerSecondMaximum, UtilizationMetricsEbsWriteOpsPerSecondMaximum, UtilizationMetricsEbsReadBytesPerSecondMaximum, UtilizationMetricsEbsWriteBytesPerSecondMaximum, UtilizationMetricsDiskReadOpsPerSecondMaximum, UtilizationMetricsDiskWriteOpsPerSecondMaximum, UtilizationMetricsDiskReadBytesPerSecondMaximum, UtilizationMetricsDiskWriteBytesPerSecondMaximum, UtilizationMetricsNetworkInBytesPerSecondMaximum, UtilizationMetricsNetworkOutBytesPerSecondMaximum, UtilizationMetricsNetworkPacketsInPerSecondMaximum, UtilizationMetricsNetworkPacketsOutPerSecondMaximum, CurrentOnDemandPrice, CurrentStandardOneYearNoUpfrontReservedPrice, CurrentStandardThreeYearNoUpfrontReservedPrice, CurrentVCpus, CurrentMemory, CurrentStorage, CurrentNetwork, RecommendationOptionsInstanceType, RecommendationOptionsProjectedUtilizationMetricsCpuMaximum, RecommendationOptionsProjectedUtilizationMetricsMemoryMaximum, RecommendationOptionsPlatformDifferences, RecommendationOptionsPerformanceRisk, RecommendationOptionsVcpus, RecommendationOptionsMemory, RecommendationOptionsStorage, RecommendationOptionsNetwork, RecommendationOptionsOnDemandPrice, RecommendationOptionsStandardOneYearNoUpfrontReservedPrice, RecommendationOptionsStandardThreeYearNoUpfrontReservedPrice, RecommendationsSourcesRecommendationSourceArn, RecommendationsSourcesRecommendationSourceType, LastRefreshTimestamp
    #         s3_destination_config: { # required
    #           bucket: "DestinationBucket",
    #           key_prefix: "DestinationKeyPrefix",
    #         },
    #         file_format: "Csv", # accepts Csv
    #         include_member_accounts: false,
    #       }
    #
    # @!attribute [rw] account_ids
    #   The IDs of the AWS accounts for which to export instance
    #   recommendations.
    #
    #   If your account is the management account of an organization, use
    #   this parameter to specify the member account for which you want to
    #   export recommendations.
    #
    #   This parameter cannot be specified together with the include member
    #   accounts parameter. The parameters are mutually exclusive.
    #
    #   Recommendations for member accounts are not included in the export
    #   if this parameter, or the include member accounts parameter, is
    #   omitted.
    #
    #   You can specify multiple account IDs per request.
    #   @return [Array<String>]
    #
    # @!attribute [rw] filters
    #   An array of objects that describe a filter to export a more specific
    #   set of instance recommendations.
    #   @return [Array<Types::Filter>]
    #
    # @!attribute [rw] fields_to_export
    #   The recommendations data to include in the export file. For more
    #   information about the fields that can be exported, see [Exported
    #   files][1] in the *Compute Optimizer User Guide*.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html#exported-files
    #   @return [Array<String>]
    #
    # @!attribute [rw] s3_destination_config
    #   An object to specify the destination Amazon Simple Storage Service
    #   (Amazon S3) bucket name and key prefix for the export job.
    #
    #   You must create the destination Amazon S3 bucket for your
    #   recommendations export before you create the export job. Compute
    #   Optimizer does not create the S3 bucket for you. After you create
    #   the S3 bucket, ensure that it has the required permission policy to
    #   allow Compute Optimizer to write the export file to it. If you plan
    #   to specify an object prefix when you create the export job, you must
    #   include the object prefix in the policy that you add to the S3
    #   bucket. For more information, see [Amazon S3 Bucket Policy for
    #   Compute Optimizer][1] in the *Compute Optimizer user guide*.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/compute-optimizer/latest/ug/create-s3-bucket-policy-for-compute-optimizer.html
    #   @return [Types::S3DestinationConfig]
    #
    # @!attribute [rw] file_format
    #   The format of the export file.
    #
    #   The only export file format currently supported is `Csv`.
    #   @return [String]
    #
    # @!attribute [rw] include_member_accounts
    #   Indicates whether to include recommendations for resources in all
    #   member accounts of the organization if your account is the
    #   management account of an organization.
    #
    #   The member accounts must also be opted in to Compute Optimizer, and
    #   trusted access for Compute Optimizer must be enabled in the
    #   organization account. For more information, see [Compute Optimizer
    #   and AWS Organizations trusted access][1] in the *AWS Compute
    #   Optimizer User Guide*.
    #
    #   Recommendations for member accounts of the organization are not
    #   included in the export file if this parameter is omitted.
    #
    #   Recommendations for member accounts are not included in the export
    #   if this parameter, or the account IDs parameter, is omitted.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/compute-optimizer/latest/ug/security-iam.html#trusted-service-access
    #   @return [Boolean]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/ExportEC2InstanceRecommendationsRequest AWS API Documentation
    #
    class ExportEC2InstanceRecommendationsRequest < Struct.new(
      :account_ids,
      :filters,
      :fields_to_export,
      :s3_destination_config,
      :file_format,
      :include_member_accounts)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] job_id
    #   The identification number of the export job.
    #
    #   Use the `DescribeRecommendationExportJobs` action, and specify the
    #   job ID to view the status of an export job.
    #   @return [String]
    #
    # @!attribute [rw] s3_destination
    #   An object that describes the destination Amazon S3 bucket of a
    #   recommendations export file.
    #   @return [Types::S3Destination]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/ExportEC2InstanceRecommendationsResponse AWS API Documentation
    #
    class ExportEC2InstanceRecommendationsResponse < Struct.new(
      :job_id,
      :s3_destination)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass ExportLambdaFunctionRecommendationsRequest
    #   data as a hash:
    #
    #       {
    #         account_ids: ["AccountId"],
    #         filters: [
    #           {
    #             name: "Finding", # accepts Finding, FindingReasonCode
    #             values: ["FilterValue"],
    #           },
    #         ],
    #         fields_to_export: ["AccountId"], # accepts AccountId, FunctionArn, FunctionVersion, Finding, FindingReasonCodes, NumberOfInvocations, UtilizationMetricsDurationMaximum, UtilizationMetricsDurationAverage, UtilizationMetricsMemoryMaximum, UtilizationMetricsMemoryAverage, LookbackPeriodInDays, CurrentConfigurationMemorySize, CurrentConfigurationTimeout, CurrentCostTotal, CurrentCostAverage, RecommendationOptionsConfigurationMemorySize, RecommendationOptionsCostLow, RecommendationOptionsCostHigh, RecommendationOptionsProjectedUtilizationMetricsDurationLowerBound, RecommendationOptionsProjectedUtilizationMetricsDurationUpperBound, RecommendationOptionsProjectedUtilizationMetricsDurationExpected, LastRefreshTimestamp
    #         s3_destination_config: { # required
    #           bucket: "DestinationBucket",
    #           key_prefix: "DestinationKeyPrefix",
    #         },
    #         file_format: "Csv", # accepts Csv
    #         include_member_accounts: false,
    #       }
    #
    # @!attribute [rw] account_ids
    #   The IDs of the AWS accounts for which to export Lambda function
    #   recommendations.
    #
    #   If your account is the management account of an organization, use
    #   this parameter to specify the member account for which you want to
    #   export recommendations.
    #
    #   This parameter cannot be specified together with the include member
    #   accounts parameter. The parameters are mutually exclusive.
    #
    #   Recommendations for member accounts are not included in the export
    #   if this parameter, or the include member accounts parameter, is
    #   omitted.
    #
    #   You can specify multiple account IDs per request.
    #   @return [Array<String>]
    #
    # @!attribute [rw] filters
    #   An array of objects that describe a filter to export a more specific
    #   set of Lambda function recommendations.
    #   @return [Array<Types::LambdaFunctionRecommendationFilter>]
    #
    # @!attribute [rw] fields_to_export
    #   The recommendations data to include in the export file. For more
    #   information about the fields that can be exported, see [Exported
    #   files][1] in the *Compute Optimizer User Guide*.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/compute-optimizer/latest/ug/exporting-recommendations.html#exported-files
    #   @return [Array<String>]
    #
    # @!attribute [rw] s3_destination_config
    #   Describes the destination Amazon Simple Storage Service (Amazon S3)
    #   bucket name and key prefix for a recommendations export job.
    #
    #   You must create the destination Amazon S3 bucket for your
    #   recommendations export before you create the export job. Compute
    #   Optimizer does not create the S3 bucket for you. After you create
    #   the S3 bucket, ensure that it has the required permission policy to
    #   allow Compute Optimizer to write the export file to it. If you plan
    #   to specify an object prefix when you create the export job, you must
    #   include the object prefix in the policy that you add to the S3
    #   bucket. For more information, see [Amazon S3 Bucket Policy for
    #   Compute Optimizer][1] in the *Compute Optimizer user guide*.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/compute-optimizer/latest/ug/create-s3-bucket-policy-for-compute-optimizer.html
    #   @return [Types::S3DestinationConfig]
    #
    # @!attribute [rw] file_format
    #   The format of the export file.
    #
    #   The only export file format currently supported is `Csv`.
    #   @return [String]
    #
    # @!attribute [rw] include_member_accounts
    #   Indicates whether to include recommendations for resources in all
    #   member accounts of the organization if your account is the
    #   management account of an organization.
    #
    #   The member accounts must also be opted in to Compute Optimizer, and
    #   trusted access for Compute Optimizer must be enabled in the
    #   organization account. For more information, see [Compute Optimizer
    #   and AWS Organizations trusted access][1] in the *AWS Compute
    #   Optimizer User Guide*.
    #
    #   Recommendations for member accounts of the organization are not
    #   included in the export file if this parameter is omitted.
    #
    #   This parameter cannot be specified together with the account IDs
    #   parameter. The parameters are mutually exclusive.
    #
    #   Recommendations for member accounts are not included in the export
    #   if this parameter, or the account IDs parameter, is omitted.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/compute-optimizer/latest/ug/security-iam.html#trusted-service-access
    #   @return [Boolean]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/ExportLambdaFunctionRecommendationsRequest AWS API Documentation
    #
    class ExportLambdaFunctionRecommendationsRequest < Struct.new(
      :account_ids,
      :filters,
      :fields_to_export,
      :s3_destination_config,
      :file_format,
      :include_member_accounts)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] job_id
    #   The identification number of the export job.
    #
    #   Use the `DescribeRecommendationExportJobs` action, and specify the
    #   job ID to view the status of an export job.
    #   @return [String]
    #
    # @!attribute [rw] s3_destination
    #   Describes the destination Amazon Simple Storage Service (Amazon S3)
    #   bucket name and object keys of a recommendations export file, and
    #   its associated metadata file.
    #   @return [Types::S3Destination]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/ExportLambdaFunctionRecommendationsResponse AWS API Documentation
    #
    class ExportLambdaFunctionRecommendationsResponse < Struct.new(
      :job_id,
      :s3_destination)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes a filter that returns a more specific list of
    # recommendations. Use this filter with the
    # `GetAutoScalingGroupRecommendations` and
    # `GetEC2InstanceRecommendations` actions.
    #
    # You can use `EBSFilter` with the `GetEBSVolumeRecommendations` action,
    # `LambdaFunctionRecommendationFilter` with the
    # `GetLambdaFunctionRecommendations` action, and `JobFilter` with the
    # `DescribeRecommendationExportJobs` action.
    #
    # @note When making an API call, you may pass Filter
    #   data as a hash:
    #
    #       {
    #         name: "Finding", # accepts Finding, FindingReasonCodes, RecommendationSourceType
    #         values: ["FilterValue"],
    #       }
    #
    # @!attribute [rw] name
    #   The name of the filter.
    #
    #   Specify `Finding` to return recommendations with a specific finding
    #   classification (e.g., `Underprovisioned`).
    #
    #   Specify `RecommendationSourceType` to return recommendations of a
    #   specific resource type (e.g., `Ec2Instance`).
    #
    #   Specify `FindingReasonCodes` to return recommendations with a
    #   specific finding reason code (e.g., `CPUUnderprovisioned`).
    #   @return [String]
    #
    # @!attribute [rw] values
    #   The value of the filter.
    #
    #   The valid values for this parameter are as follows, depending on
    #   what you specify for the `name` parameter and the resource type that
    #   you wish to filter results for:
    #
    #   * Specify `Optimized` or `NotOptimized` if you specify the `name`
    #     parameter as `Finding` and you want to filter results for Auto
    #     Scaling groups.
    #
    #   * Specify `Underprovisioned`, `Overprovisioned`, or `Optimized` if
    #     you specify the `name` parameter as `Finding` and you want to
    #     filter results for EC2 instances.
    #
    #   * Specify `Ec2Instance` or `AutoScalingGroup` if you specify the
    #     `name` parameter as `RecommendationSourceType`.
    #
    #   * Specify one of the following options if you specify the `name`
    #     parameter as `FindingReasonCodes`\:
    #
    #     * <b> <code>CPUOverprovisioned</code> </b> — The instance’s CPU
    #       configuration can be sized down while still meeting the
    #       performance requirements of your workload.
    #
    #     * <b> <code>CPUUnderprovisioned</code> </b> — The instance’s CPU
    #       configuration doesn't meet the performance requirements of your
    #       workload and there is an alternative instance type that provides
    #       better CPU performance.
    #
    #     * <b> <code>MemoryOverprovisioned</code> </b> — The instance’s
    #       memory configuration can be sized down while still meeting the
    #       performance requirements of your workload.
    #
    #     * <b> <code>MemoryUnderprovisioned</code> </b> — The instance’s
    #       memory configuration doesn't meet the performance requirements
    #       of your workload and there is an alternative instance type that
    #       provides better memory performance.
    #
    #     * <b> <code>EBSThroughputOverprovisioned</code> </b> — The
    #       instance’s EBS throughput configuration can be sized down while
    #       still meeting the performance requirements of your workload.
    #
    #     * <b> <code>EBSThroughputUnderprovisioned</code> </b> — The
    #       instance’s EBS throughput configuration doesn't meet the
    #       performance requirements of your workload and there is an
    #       alternative instance type that provides better EBS throughput
    #       performance.
    #
    #     * <b> <code>EBSIOPSOverprovisioned</code> </b> — The instance’s
    #       EBS IOPS configuration can be sized down while still meeting the
    #       performance requirements of your workload.
    #
    #     * <b> <code>EBSIOPSUnderprovisioned</code> </b> — The instance’s
    #       EBS IOPS configuration doesn't meet the performance
    #       requirements of your workload and there is an alternative
    #       instance type that provides better EBS IOPS performance.
    #
    #     * <b> <code>NetworkBandwidthOverprovisioned</code> </b> — The
    #       instance’s network bandwidth configuration can be sized down
    #       while still meeting the performance requirements of your
    #       workload.
    #
    #     * <b> <code>NetworkBandwidthUnderprovisioned</code> </b> — The
    #       instance’s network bandwidth configuration doesn't meet the
    #       performance requirements of your workload and there is an
    #       alternative instance type that provides better network bandwidth
    #       performance. This finding reason happens when the `NetworkIn` or
    #       `NetworkOut` performance of an instance is impacted.
    #
    #     * <b> <code>NetworkPPSOverprovisioned</code> </b> — The instance’s
    #       network PPS (packets per second) configuration can be sized down
    #       while still meeting the performance requirements of your
    #       workload.
    #
    #     * <b> <code>NetworkPPSUnderprovisioned</code> </b> — The
    #       instance’s network PPS (packets per second) configuration
    #       doesn't meet the performance requirements of your workload and
    #       there is an alternative instance type that provides better
    #       network PPS performance.
    #
    #     * <b> <code>DiskIOPSOverprovisioned</code> </b> — The instance’s
    #       disk IOPS configuration can be sized down while still meeting
    #       the performance requirements of your workload.
    #
    #     * <b> <code>DiskIOPSUnderprovisioned</code> </b> — The instance’s
    #       disk IOPS configuration doesn't meet the performance
    #       requirements of your workload and there is an alternative
    #       instance type that provides better disk IOPS performance.
    #
    #     * <b> <code>DiskThroughputOverprovisioned</code> </b> — The
    #       instance’s disk throughput configuration can be sized down while
    #       still meeting the performance requirements of your workload.
    #
    #     * <b> <code>DiskThroughputUnderprovisioned</code> </b> — The
    #       instance’s disk throughput configuration doesn't meet the
    #       performance requirements of your workload and there is an
    #       alternative instance type that provides better disk throughput
    #       performance.
    #   @return [Array<String>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/Filter AWS API Documentation
    #
    class Filter < Struct.new(
      :name,
      :values)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass GetAutoScalingGroupRecommendationsRequest
    #   data as a hash:
    #
    #       {
    #         account_ids: ["AccountId"],
    #         auto_scaling_group_arns: ["AutoScalingGroupArn"],
    #         next_token: "NextToken",
    #         max_results: 1,
    #         filters: [
    #           {
    #             name: "Finding", # accepts Finding, FindingReasonCodes, RecommendationSourceType
    #             values: ["FilterValue"],
    #           },
    #         ],
    #       }
    #
    # @!attribute [rw] account_ids
    #   The ID of the AWS account for which to return Auto Scaling group
    #   recommendations.
    #
    #   If your account is the management account of an organization, use
    #   this parameter to specify the member account for which you want to
    #   return Auto Scaling group recommendations.
    #
    #   Only one account ID can be specified per request.
    #   @return [Array<String>]
    #
    # @!attribute [rw] auto_scaling_group_arns
    #   The Amazon Resource Name (ARN) of the Auto Scaling groups for which
    #   to return recommendations.
    #   @return [Array<String>]
    #
    # @!attribute [rw] next_token
    #   The token to advance to the next page of Auto Scaling group
    #   recommendations.
    #   @return [String]
    #
    # @!attribute [rw] max_results
    #   The maximum number of Auto Scaling group recommendations to return
    #   with a single request.
    #
    #   To retrieve the remaining results, make another request with the
    #   returned `NextToken` value.
    #   @return [Integer]
    #
    # @!attribute [rw] filters
    #   An array of objects that describe a filter that returns a more
    #   specific list of Auto Scaling group recommendations.
    #   @return [Array<Types::Filter>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/GetAutoScalingGroupRecommendationsRequest AWS API Documentation
    #
    class GetAutoScalingGroupRecommendationsRequest < Struct.new(
      :account_ids,
      :auto_scaling_group_arns,
      :next_token,
      :max_results,
      :filters)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] next_token
    #   The token to use to advance to the next page of Auto Scaling group
    #   recommendations.
    #
    #   This value is null when there are no more pages of Auto Scaling
    #   group recommendations to return.
    #   @return [String]
    #
    # @!attribute [rw] auto_scaling_group_recommendations
    #   An array of objects that describe Auto Scaling group
    #   recommendations.
    #   @return [Array<Types::AutoScalingGroupRecommendation>]
    #
    # @!attribute [rw] errors
    #   An array of objects that describe errors of the request.
    #
    #   For example, an error is returned if you request recommendations for
    #   an unsupported Auto Scaling group.
    #   @return [Array<Types::GetRecommendationError>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/GetAutoScalingGroupRecommendationsResponse AWS API Documentation
    #
    class GetAutoScalingGroupRecommendationsResponse < Struct.new(
      :next_token,
      :auto_scaling_group_recommendations,
      :errors)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass GetEBSVolumeRecommendationsRequest
    #   data as a hash:
    #
    #       {
    #         volume_arns: ["VolumeArn"],
    #         next_token: "NextToken",
    #         max_results: 1,
    #         filters: [
    #           {
    #             name: "Finding", # accepts Finding
    #             values: ["FilterValue"],
    #           },
    #         ],
    #         account_ids: ["AccountId"],
    #       }
    #
    # @!attribute [rw] volume_arns
    #   The Amazon Resource Name (ARN) of the volumes for which to return
    #   recommendations.
    #   @return [Array<String>]
    #
    # @!attribute [rw] next_token
    #   The token to advance to the next page of volume recommendations.
    #   @return [String]
    #
    # @!attribute [rw] max_results
    #   The maximum number of volume recommendations to return with a single
    #   request.
    #
    #   To retrieve the remaining results, make another request with the
    #   returned `NextToken` value.
    #   @return [Integer]
    #
    # @!attribute [rw] filters
    #   An array of objects that describe a filter that returns a more
    #   specific list of volume recommendations.
    #   @return [Array<Types::EBSFilter>]
    #
    # @!attribute [rw] account_ids
    #   The ID of the AWS account for which to return volume
    #   recommendations.
    #
    #   If your account is the management account of an organization, use
    #   this parameter to specify the member account for which you want to
    #   return volume recommendations.
    #
    #   Only one account ID can be specified per request.
    #   @return [Array<String>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/GetEBSVolumeRecommendationsRequest AWS API Documentation
    #
    class GetEBSVolumeRecommendationsRequest < Struct.new(
      :volume_arns,
      :next_token,
      :max_results,
      :filters,
      :account_ids)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] next_token
    #   The token to use to advance to the next page of volume
    #   recommendations.
    #
    #   This value is null when there are no more pages of volume
    #   recommendations to return.
    #   @return [String]
    #
    # @!attribute [rw] volume_recommendations
    #   An array of objects that describe volume recommendations.
    #   @return [Array<Types::VolumeRecommendation>]
    #
    # @!attribute [rw] errors
    #   An array of objects that describe errors of the request.
    #
    #   For example, an error is returned if you request recommendations for
    #   an unsupported volume.
    #   @return [Array<Types::GetRecommendationError>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/GetEBSVolumeRecommendationsResponse AWS API Documentation
    #
    class GetEBSVolumeRecommendationsResponse < Struct.new(
      :next_token,
      :volume_recommendations,
      :errors)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass GetEC2InstanceRecommendationsRequest
    #   data as a hash:
    #
    #       {
    #         instance_arns: ["InstanceArn"],
    #         next_token: "NextToken",
    #         max_results: 1,
    #         filters: [
    #           {
    #             name: "Finding", # accepts Finding, FindingReasonCodes, RecommendationSourceType
    #             values: ["FilterValue"],
    #           },
    #         ],
    #         account_ids: ["AccountId"],
    #       }
    #
    # @!attribute [rw] instance_arns
    #   The Amazon Resource Name (ARN) of the instances for which to return
    #   recommendations.
    #   @return [Array<String>]
    #
    # @!attribute [rw] next_token
    #   The token to advance to the next page of instance recommendations.
    #   @return [String]
    #
    # @!attribute [rw] max_results
    #   The maximum number of instance recommendations to return with a
    #   single request.
    #
    #   To retrieve the remaining results, make another request with the
    #   returned `NextToken` value.
    #   @return [Integer]
    #
    # @!attribute [rw] filters
    #   An array of objects that describe a filter that returns a more
    #   specific list of instance recommendations.
    #   @return [Array<Types::Filter>]
    #
    # @!attribute [rw] account_ids
    #   The ID of the AWS account for which to return instance
    #   recommendations.
    #
    #   If your account is the management account of an organization, use
    #   this parameter to specify the member account for which you want to
    #   return instance recommendations.
    #
    #   Only one account ID can be specified per request.
    #   @return [Array<String>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/GetEC2InstanceRecommendationsRequest AWS API Documentation
    #
    class GetEC2InstanceRecommendationsRequest < Struct.new(
      :instance_arns,
      :next_token,
      :max_results,
      :filters,
      :account_ids)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] next_token
    #   The token to use to advance to the next page of instance
    #   recommendations.
    #
    #   This value is null when there are no more pages of instance
    #   recommendations to return.
    #   @return [String]
    #
    # @!attribute [rw] instance_recommendations
    #   An array of objects that describe instance recommendations.
    #   @return [Array<Types::InstanceRecommendation>]
    #
    # @!attribute [rw] errors
    #   An array of objects that describe errors of the request.
    #
    #   For example, an error is returned if you request recommendations for
    #   an instance of an unsupported instance family.
    #   @return [Array<Types::GetRecommendationError>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/GetEC2InstanceRecommendationsResponse AWS API Documentation
    #
    class GetEC2InstanceRecommendationsResponse < Struct.new(
      :next_token,
      :instance_recommendations,
      :errors)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass GetEC2RecommendationProjectedMetricsRequest
    #   data as a hash:
    #
    #       {
    #         instance_arn: "InstanceArn", # required
    #         stat: "Maximum", # required, accepts Maximum, Average
    #         period: 1, # required
    #         start_time: Time.now, # required
    #         end_time: Time.now, # required
    #       }
    #
    # @!attribute [rw] instance_arn
    #   The Amazon Resource Name (ARN) of the instances for which to return
    #   recommendation projected metrics.
    #   @return [String]
    #
    # @!attribute [rw] stat
    #   The statistic of the projected metrics.
    #   @return [String]
    #
    # @!attribute [rw] period
    #   The granularity, in seconds, of the projected metrics data points.
    #   @return [Integer]
    #
    # @!attribute [rw] start_time
    #   The time stamp of the first projected metrics data point to return.
    #   @return [Time]
    #
    # @!attribute [rw] end_time
    #   The time stamp of the last projected metrics data point to return.
    #   @return [Time]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/GetEC2RecommendationProjectedMetricsRequest AWS API Documentation
    #
    class GetEC2RecommendationProjectedMetricsRequest < Struct.new(
      :instance_arn,
      :stat,
      :period,
      :start_time,
      :end_time)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] recommended_option_projected_metrics
    #   An array of objects that describe a projected metrics.
    #   @return [Array<Types::RecommendedOptionProjectedMetric>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/GetEC2RecommendationProjectedMetricsResponse AWS API Documentation
    #
    class GetEC2RecommendationProjectedMetricsResponse < Struct.new(
      :recommended_option_projected_metrics)
      SENSITIVE = []
      include Aws::Structure
    end

    # @api private
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/GetEnrollmentStatusRequest AWS API Documentation
    #
    class GetEnrollmentStatusRequest < Aws::EmptyStructure; end

    # @!attribute [rw] status
    #   The enrollment status of the account.
    #   @return [String]
    #
    # @!attribute [rw] status_reason
    #   The reason for the enrollment status of the account.
    #
    #   For example, an account might show a status of `Pending` because
    #   member accounts of an organization require more time to be enrolled
    #   in the service.
    #   @return [String]
    #
    # @!attribute [rw] member_accounts_enrolled
    #   Confirms the enrollment status of member accounts within the
    #   organization, if the account is a management account of an
    #   organization.
    #   @return [Boolean]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/GetEnrollmentStatusResponse AWS API Documentation
    #
    class GetEnrollmentStatusResponse < Struct.new(
      :status,
      :status_reason,
      :member_accounts_enrolled)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass GetLambdaFunctionRecommendationsRequest
    #   data as a hash:
    #
    #       {
    #         function_arns: ["FunctionArn"],
    #         account_ids: ["AccountId"],
    #         filters: [
    #           {
    #             name: "Finding", # accepts Finding, FindingReasonCode
    #             values: ["FilterValue"],
    #           },
    #         ],
    #         next_token: "NextToken",
    #         max_results: 1,
    #       }
    #
    # @!attribute [rw] function_arns
    #   The Amazon Resource Name (ARN) of the functions for which to return
    #   recommendations.
    #
    #   You can specify a qualified or unqualified ARN. If you specify an
    #   unqualified ARN without a function version suffix, Compute Optimizer
    #   will return recommendations for the latest (`$LATEST`) version of
    #   the function. If you specify a qualified ARN with a version suffix,
    #   Compute Optimizer will return recommendations for the specified
    #   function version. For more information about using function
    #   versions, see [Using versions][1] in the *AWS Lambda Developer
    #   Guide*.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/lambda/latest/dg/configuration-versions.html#versioning-versions-using
    #   @return [Array<String>]
    #
    # @!attribute [rw] account_ids
    #   The ID of the AWS account for which to return function
    #   recommendations.
    #
    #   If your account is the management account of an organization, use
    #   this parameter to specify the member account for which you want to
    #   return function recommendations.
    #
    #   Only one account ID can be specified per request.
    #   @return [Array<String>]
    #
    # @!attribute [rw] filters
    #   An array of objects that describe a filter that returns a more
    #   specific list of function recommendations.
    #   @return [Array<Types::LambdaFunctionRecommendationFilter>]
    #
    # @!attribute [rw] next_token
    #   The token to advance to the next page of function recommendations.
    #   @return [String]
    #
    # @!attribute [rw] max_results
    #   The maximum number of function recommendations to return with a
    #   single request.
    #
    #   To retrieve the remaining results, make another request with the
    #   returned `NextToken` value.
    #   @return [Integer]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/GetLambdaFunctionRecommendationsRequest AWS API Documentation
    #
    class GetLambdaFunctionRecommendationsRequest < Struct.new(
      :function_arns,
      :account_ids,
      :filters,
      :next_token,
      :max_results)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] next_token
    #   The token to use to advance to the next page of function
    #   recommendations.
    #
    #   This value is null when there are no more pages of function
    #   recommendations to return.
    #   @return [String]
    #
    # @!attribute [rw] lambda_function_recommendations
    #   An array of objects that describe function recommendations.
    #   @return [Array<Types::LambdaFunctionRecommendation>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/GetLambdaFunctionRecommendationsResponse AWS API Documentation
    #
    class GetLambdaFunctionRecommendationsResponse < Struct.new(
      :next_token,
      :lambda_function_recommendations)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes an error experienced when getting recommendations.
    #
    # For example, an error is returned if you request recommendations for
    # an unsupported Auto Scaling group, or if you request recommendations
    # for an instance of an unsupported instance family.
    #
    # @!attribute [rw] identifier
    #   The ID of the error.
    #   @return [String]
    #
    # @!attribute [rw] code
    #   The error code.
    #   @return [String]
    #
    # @!attribute [rw] message
    #   The message, or reason, for the error.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/GetRecommendationError AWS API Documentation
    #
    class GetRecommendationError < Struct.new(
      :identifier,
      :code,
      :message)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass GetRecommendationSummariesRequest
    #   data as a hash:
    #
    #       {
    #         account_ids: ["AccountId"],
    #         next_token: "NextToken",
    #         max_results: 1,
    #       }
    #
    # @!attribute [rw] account_ids
    #   The ID of the AWS account for which to return recommendation
    #   summaries.
    #
    #   If your account is the management account of an organization, use
    #   this parameter to specify the member account for which you want to
    #   return recommendation summaries.
    #
    #   Only one account ID can be specified per request.
    #   @return [Array<String>]
    #
    # @!attribute [rw] next_token
    #   The token to advance to the next page of recommendation summaries.
    #   @return [String]
    #
    # @!attribute [rw] max_results
    #   The maximum number of recommendation summaries to return with a
    #   single request.
    #
    #   To retrieve the remaining results, make another request with the
    #   returned `NextToken` value.
    #   @return [Integer]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/GetRecommendationSummariesRequest AWS API Documentation
    #
    class GetRecommendationSummariesRequest < Struct.new(
      :account_ids,
      :next_token,
      :max_results)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] next_token
    #   The token to use to advance to the next page of recommendation
    #   summaries.
    #
    #   This value is null when there are no more pages of recommendation
    #   summaries to return.
    #   @return [String]
    #
    # @!attribute [rw] recommendation_summaries
    #   An array of objects that summarize a recommendation.
    #   @return [Array<Types::RecommendationSummary>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/GetRecommendationSummariesResponse AWS API Documentation
    #
    class GetRecommendationSummariesResponse < Struct.new(
      :next_token,
      :recommendation_summaries)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes an Amazon EC2 instance recommendation.
    #
    # @!attribute [rw] instance_arn
    #   The Amazon Resource Name (ARN) of the current instance.
    #   @return [String]
    #
    # @!attribute [rw] account_id
    #   The AWS account ID of the instance.
    #   @return [String]
    #
    # @!attribute [rw] instance_name
    #   The name of the current instance.
    #   @return [String]
    #
    # @!attribute [rw] current_instance_type
    #   The instance type of the current instance.
    #   @return [String]
    #
    # @!attribute [rw] finding
    #   The finding classification of the instance.
    #
    #   Findings for instances include:
    #
    #   * <b> <code>Underprovisioned</code> </b>—An instance is considered
    #     under-provisioned when at least one specification of your
    #     instance, such as CPU, memory, or network, does not meet the
    #     performance requirements of your workload. Under-provisioned
    #     instances may lead to poor application performance.
    #
    #   * <b> <code>Overprovisioned</code> </b>—An instance is considered
    #     over-provisioned when at least one specification of your instance,
    #     such as CPU, memory, or network, can be sized down while still
    #     meeting the performance requirements of your workload, and no
    #     specification is under-provisioned. Over-provisioned instances may
    #     lead to unnecessary infrastructure cost.
    #
    #   * <b> <code>Optimized</code> </b>—An instance is considered
    #     optimized when all specifications of your instance, such as CPU,
    #     memory, and network, meet the performance requirements of your
    #     workload and is not over provisioned. For optimized resources, AWS
    #     Compute Optimizer might recommend a new generation instance type.
    #   @return [String]
    #
    # @!attribute [rw] finding_reason_codes
    #   The reason for the finding classification of the instance.
    #
    #   Finding reason codes for instances include:
    #
    #   * <b> <code>CPUOverprovisioned</code> </b> — The instance’s CPU
    #     configuration can be sized down while still meeting the
    #     performance requirements of your workload. This is identified by
    #     analyzing the `CPUUtilization` metric of the current instance
    #     during the look-back period.
    #
    #   * <b> <code>CPUUnderprovisioned</code> </b> — The instance’s CPU
    #     configuration doesn't meet the performance requirements of your
    #     workload and there is an alternative instance type that provides
    #     better CPU performance. This is identified by analyzing the
    #     `CPUUtilization` metric of the current instance during the
    #     look-back period.
    #
    #   * <b> <code>MemoryOverprovisioned</code> </b> — The instance’s
    #     memory configuration can be sized down while still meeting the
    #     performance requirements of your workload. This is identified by
    #     analyzing the memory utilization metric of the current instance
    #     during the look-back period.
    #
    #   * <b> <code>MemoryUnderprovisioned</code> </b> — The instance’s
    #     memory configuration doesn't meet the performance requirements of
    #     your workload and there is an alternative instance type that
    #     provides better memory performance. This is identified by
    #     analyzing the memory utilization metric of the current instance
    #     during the look-back period.
    #
    #     <note markdown="1"> Memory utilization is analyzed only for resources that have the
    #     unified CloudWatch agent installed on them. For more information,
    #     see [Enabling memory utilization with the Amazon CloudWatch
    #     Agent][1] in the *AWS Compute Optimizer User Guide*. On Linux
    #     instances, Compute Optimizer analyses the `mem_used_percent`
    #     metric in the `CWAgent` namespace, or the legacy
    #     `MemoryUtilization` metric in the `System/Linux` namespace. On
    #     Windows instances, Compute Optimizer analyses the `Memory %
    #     Committed Bytes In Use` metric in the `CWAgent` namespace.
    #
    #      </note>
    #
    #   * <b> <code>EBSThroughputOverprovisioned</code> </b> — The
    #     instance’s EBS throughput configuration can be sized down while
    #     still meeting the performance requirements of your workload. This
    #     is identified by analyzing the `VolumeReadOps` and
    #     `VolumeWriteOps` metrics of EBS volumes attached to the current
    #     instance during the look-back period.
    #
    #   * <b> <code>EBSThroughputUnderprovisioned</code> </b> — The
    #     instance’s EBS throughput configuration doesn't meet the
    #     performance requirements of your workload and there is an
    #     alternative instance type that provides better EBS throughput
    #     performance. This is identified by analyzing the `VolumeReadOps`
    #     and `VolumeWriteOps` metrics of EBS volumes attached to the
    #     current instance during the look-back period.
    #
    #   * <b> <code>EBSIOPSOverprovisioned</code> </b> — The instance’s EBS
    #     IOPS configuration can be sized down while still meeting the
    #     performance requirements of your workload. This is identified by
    #     analyzing the `VolumeReadBytes` and `VolumeWriteBytes` metric of
    #     EBS volumes attached to the current instance during the look-back
    #     period.
    #
    #   * <b> <code>EBSIOPSUnderprovisioned</code> </b> — The instance’s EBS
    #     IOPS configuration doesn't meet the performance requirements of
    #     your workload and there is an alternative instance type that
    #     provides better EBS IOPS performance. This is identified by
    #     analyzing the `VolumeReadBytes` and `VolumeWriteBytes` metric of
    #     EBS volumes attached to the current instance during the look-back
    #     period.
    #
    #   * <b> <code>NetworkBandwidthOverprovisioned</code> </b> — The
    #     instance’s network bandwidth configuration can be sized down while
    #     still meeting the performance requirements of your workload. This
    #     is identified by analyzing the `NetworkIn` and `NetworkOut`
    #     metrics of the current instance during the look-back period.
    #
    #   * <b> <code>NetworkBandwidthUnderprovisioned</code> </b> — The
    #     instance’s network bandwidth configuration doesn't meet the
    #     performance requirements of your workload and there is an
    #     alternative instance type that provides better network bandwidth
    #     performance. This is identified by analyzing the `NetworkIn` and
    #     `NetworkOut` metrics of the current instance during the look-back
    #     period. This finding reason happens when the `NetworkIn` or
    #     `NetworkOut` performance of an instance is impacted.
    #
    #   * <b> <code>NetworkPPSOverprovisioned</code> </b> — The instance’s
    #     network PPS (packets per second) configuration can be sized down
    #     while still meeting the performance requirements of your workload.
    #     This is identified by analyzing the `NetworkPacketsIn` and
    #     `NetworkPacketsIn` metrics of the current instance during the
    #     look-back period.
    #
    #   * <b> <code>NetworkPPSUnderprovisioned</code> </b> — The instance’s
    #     network PPS (packets per second) configuration doesn't meet the
    #     performance requirements of your workload and there is an
    #     alternative instance type that provides better network PPS
    #     performance. This is identified by analyzing the
    #     `NetworkPacketsIn` and `NetworkPacketsIn` metrics of the current
    #     instance during the look-back period.
    #
    #   * <b> <code>DiskIOPSOverprovisioned</code> </b> — The instance’s
    #     disk IOPS configuration can be sized down while still meeting the
    #     performance requirements of your workload. This is identified by
    #     analyzing the `DiskReadOps` and `DiskWriteOps` metrics of the
    #     current instance during the look-back period.
    #
    #   * <b> <code>DiskIOPSUnderprovisioned</code> </b> — The instance’s
    #     disk IOPS configuration doesn't meet the performance requirements
    #     of your workload and there is an alternative instance type that
    #     provides better disk IOPS performance. This is identified by
    #     analyzing the `DiskReadOps` and `DiskWriteOps` metrics of the
    #     current instance during the look-back period.
    #
    #   * <b> <code>DiskThroughputOverprovisioned</code> </b> — The
    #     instance’s disk throughput configuration can be sized down while
    #     still meeting the performance requirements of your workload. This
    #     is identified by analyzing the `DiskReadBytes` and
    #     `DiskWriteBytes` metrics of the current instance during the
    #     look-back period.
    #
    #   * <b> <code>DiskThroughputUnderprovisioned</code> </b> — The
    #     instance’s disk throughput configuration doesn't meet the
    #     performance requirements of your workload and there is an
    #     alternative instance type that provides better disk throughput
    #     performance. This is identified by analyzing the `DiskReadBytes`
    #     and `DiskWriteBytes` metrics of the current instance during the
    #     look-back period.
    #
    #   <note markdown="1"> For more information about instance metrics, see [List the available
    #   CloudWatch metrics for your instances][2] in the *Amazon Elastic
    #   Compute Cloud User Guide*. For more information about EBS volume
    #   metrics, see [Amazon CloudWatch metrics for Amazon EBS][3] in the
    #   *Amazon Elastic Compute Cloud User Guide*.
    #
    #    </note>
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent
    #   [2]: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/viewing_metrics_with_cloudwatch.html
    #   [3]: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using_cloudwatch_ebs.html
    #   @return [Array<String>]
    #
    # @!attribute [rw] utilization_metrics
    #   An array of objects that describe the utilization metrics of the
    #   instance.
    #   @return [Array<Types::UtilizationMetric>]
    #
    # @!attribute [rw] look_back_period_in_days
    #   The number of days for which utilization metrics were analyzed for
    #   the instance.
    #   @return [Float]
    #
    # @!attribute [rw] recommendation_options
    #   An array of objects that describe the recommendation options for the
    #   instance.
    #   @return [Array<Types::InstanceRecommendationOption>]
    #
    # @!attribute [rw] recommendation_sources
    #   An array of objects that describe the source resource of the
    #   recommendation.
    #   @return [Array<Types::RecommendationSource>]
    #
    # @!attribute [rw] last_refresh_timestamp
    #   The time stamp of when the instance recommendation was last
    #   refreshed.
    #   @return [Time]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/InstanceRecommendation AWS API Documentation
    #
    class InstanceRecommendation < Struct.new(
      :instance_arn,
      :account_id,
      :instance_name,
      :current_instance_type,
      :finding,
      :finding_reason_codes,
      :utilization_metrics,
      :look_back_period_in_days,
      :recommendation_options,
      :recommendation_sources,
      :last_refresh_timestamp)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes a recommendation option for an Amazon EC2 instance.
    #
    # @!attribute [rw] instance_type
    #   The instance type of the instance recommendation.
    #   @return [String]
    #
    # @!attribute [rw] projected_utilization_metrics
    #   An array of objects that describe the projected utilization metrics
    #   of the instance recommendation option.
    #
    #   <note markdown="1"> The `Cpu` and `Memory` metrics are the only projected utilization
    #   metrics returned. Additionally, the `Memory` metric is returned only
    #   for resources that have the unified CloudWatch agent installed on
    #   them. For more information, see [Enabling Memory Utilization with
    #   the CloudWatch Agent][1].
    #
    #    </note>
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent
    #   @return [Array<Types::UtilizationMetric>]
    #
    # @!attribute [rw] platform_differences
    #   Describes the configuration differences between the current instance
    #   and the recommended instance type. You should consider the
    #   configuration differences before migrating your workloads from the
    #   current instance to the recommended instance type. The [Change the
    #   instance type guide for Linux][1] and [Change the instance type
    #   guide for Windows][2] provide general guidance for getting started
    #   with an instance migration.
    #
    #   Platform differences include:
    #
    #   * <b> <code>Hypervisor</code> </b> — The hypervisor of the
    #     recommended instance type is different than that of the current
    #     instance. For example, the recommended instance type uses a Nitro
    #     hypervisor and the current instance uses a Xen hypervisor. The
    #     differences that you should consider between these hypervisors are
    #     covered in the [Nitro Hypervisor][3] section of the Amazon EC2
    #     frequently asked questions. For more information, see [Instances
    #     built on the Nitro System][4] in the *Amazon EC2 User Guide for
    #     Linux*, or [Instances built on the Nitro System][5] in the *Amazon
    #     EC2 User Guide for Windows*.
    #
    #   * <b> <code>NetworkInterface</code> </b> — The network interface of
    #     the recommended instance type is different than that of the
    #     current instance. For example, the recommended instance type
    #     supports enhanced networking and the current instance might not.
    #     To enable enhanced networking for the recommended instance type,
    #     you will need to install the Elastic Network Adapter (ENA) driver
    #     or the Intel 82599 Virtual Function driver. For more information,
    #     see [Networking and storage features][6] and [Enhanced networking
    #     on Linux][7] in the *Amazon EC2 User Guide for Linux*, or
    #     [Networking and storage features][8] and [Enhanced networking on
    #     Windows][9] in the *Amazon EC2 User Guide for Windows*.
    #
    #   * <b> <code>StorageInterface</code> </b> — The storage interface of
    #     the recommended instance type is different than that of the
    #     current instance. For example, the recommended instance type uses
    #     an NVMe storage interface and the current instance does not. To
    #     access NVMe volumes for the recommended instance type, you will
    #     need to install or upgrade the NVMe driver. For more information,
    #     see [Networking and storage features][6] and [Amazon EBS and NVMe
    #     on Linux instances][10] in the *Amazon EC2 User Guide for Linux*,
    #     or [Networking and storage features][8] and [Amazon EBS and NVMe
    #     on Windows instances][11] in the *Amazon EC2 User Guide for
    #     Windows*.
    #
    #   * <b> <code>InstanceStoreAvailability</code> </b> — The recommended
    #     instance type does not support instance store volumes and the
    #     current instance does. Before migrating, you might need to back up
    #     the data on your instance store volumes if you want to preserve
    #     them. For more information, see [How do I back up an instance
    #     store volume on my Amazon EC2 instance to Amazon EBS?][12] in the
    #     *AWS Premium Support Knowledge Base*. For more information, see
    #     [Networking and storage features][6] and [Amazon EC2 instance
    #     store][13] in the *Amazon EC2 User Guide for Linux*, or see
    #     [Networking and storage features][8] and [Amazon EC2 instance
    #     store][14] in the *Amazon EC2 User Guide for Windows*.
    #
    #   * <b> <code>VirtualizationType</code> </b> — The recommended
    #     instance type uses the hardware virtual machine (HVM)
    #     virtualization type and the current instance uses the paravirtual
    #     (PV) virtualization type. For more information about the
    #     differences between these virtualization types, see [Linux AMI
    #     virtualization types][15] in the *Amazon EC2 User Guide for
    #     Linux*, or [Windows AMI virtualization types][16] in the *Amazon
    #     EC2 User Guide for Windows*.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-resize.html
    #   [2]: https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2-instance-resize.html
    #   [3]: http://aws.amazon.com/ec2/faqs/#Nitro_Hypervisor
    #   [4]: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#ec2-nitro-instances
    #   [5]: https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/instance-types.html#ec2-nitro-instances
    #   [6]: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instance-types.html#instance-networking-storage
    #   [7]: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/enhanced-networking.html
    #   [8]: https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/instance-types.html#instance-networking-storage
    #   [9]: https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/enhanced-networking.html
    #   [10]: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/nvme-ebs-volumes.html
    #   [11]: https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/nvme-ebs-volumes.html
    #   [12]: https://aws.amazon.com/premiumsupport/knowledge-center/back-up-instance-store-ebs/
    #   [13]: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html
    #   [14]: https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/InstanceStorage.html
    #   [15]: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/virtualization_types.html
    #   [16]: https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/windows-ami-version-history.html#virtualization-types
    #   @return [Array<String>]
    #
    # @!attribute [rw] performance_risk
    #   The performance risk of the instance recommendation option.
    #
    #   Performance risk indicates the likelihood of the recommended
    #   instance type not meeting the resource needs of your workload.
    #   Compute Optimizer calculates an individual performance risk score
    #   for each specification of the recommended instance, including CPU,
    #   memory, EBS throughput, EBS IOPS, disk throughput, disk IOPS,
    #   network throughput, and network PPS. The performance risk of the
    #   recommended instance is calculated as the maximum performance risk
    #   score across the analyzed resource specifications.
    #
    #   The value ranges from `0` to `5`, with `0` meaning that the
    #   recommended resource is predicted to always provide enough hardware
    #   capability. The higher the performance risk is, the more likely you
    #   should validate whether the recommendation will meet the performance
    #   requirements of your workload before migrating your resource.
    #   @return [Float]
    #
    # @!attribute [rw] rank
    #   The rank of the instance recommendation option.
    #
    #   The top recommendation option is ranked as `1`.
    #   @return [Integer]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/InstanceRecommendationOption AWS API Documentation
    #
    class InstanceRecommendationOption < Struct.new(
      :instance_type,
      :projected_utilization_metrics,
      :platform_differences,
      :performance_risk,
      :rank)
      SENSITIVE = []
      include Aws::Structure
    end

    # An internal error has occurred. Try your call again.
    #
    # @!attribute [rw] message
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/InternalServerException AWS API Documentation
    #
    class InternalServerException < Struct.new(
      :message)
      SENSITIVE = []
      include Aws::Structure
    end

    # An invalid or out-of-range value was supplied for the input parameter.
    #
    # @!attribute [rw] message
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/InvalidParameterValueException AWS API Documentation
    #
    class InvalidParameterValueException < Struct.new(
      :message)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes a filter that returns a more specific list of recommendation
    # export jobs. Use this filter with the
    # `DescribeRecommendationExportJobs` action.
    #
    # You can use `EBSFilter` with the `GetEBSVolumeRecommendations` action,
    # `LambdaFunctionRecommendationFilter` with the
    # `GetLambdaFunctionRecommendations` action, and `Filter` with the
    # `GetAutoScalingGroupRecommendations` and
    # `GetEC2InstanceRecommendations` actions.
    #
    # @note When making an API call, you may pass JobFilter
    #   data as a hash:
    #
    #       {
    #         name: "ResourceType", # accepts ResourceType, JobStatus
    #         values: ["FilterValue"],
    #       }
    #
    # @!attribute [rw] name
    #   The name of the filter.
    #
    #   Specify `ResourceType` to return export jobs of a specific resource
    #   type (e.g., `Ec2Instance`).
    #
    #   Specify `JobStatus` to return export jobs with a specific status
    #   (e.g, `Complete`).
    #   @return [String]
    #
    # @!attribute [rw] values
    #   The value of the filter.
    #
    #   The valid values for this parameter are as follows, depending on
    #   what you specify for the `name` parameter:
    #
    #   * Specify `Ec2Instance` or `AutoScalingGroup` if you specify the
    #     `name` parameter as `ResourceType`. There is no filter for EBS
    #     volumes because volume recommendations cannot be exported at this
    #     time.
    #
    #   * Specify `Queued`, `InProgress`, `Complete`, or `Failed` if you
    #     specify the `name` parameter as `JobStatus`.
    #   @return [Array<String>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/JobFilter AWS API Documentation
    #
    class JobFilter < Struct.new(
      :name,
      :values)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes a projected utilization metric of an AWS Lambda function
    # recommendation option.
    #
    # @!attribute [rw] name
    #   The name of the projected utilization metric.
    #   @return [String]
    #
    # @!attribute [rw] statistic
    #   The statistic of the projected utilization metric.
    #   @return [String]
    #
    # @!attribute [rw] value
    #   The values of the projected utilization metrics.
    #   @return [Float]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/LambdaFunctionMemoryProjectedMetric AWS API Documentation
    #
    class LambdaFunctionMemoryProjectedMetric < Struct.new(
      :name,
      :statistic,
      :value)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes a recommendation option for an AWS Lambda function.
    #
    # @!attribute [rw] rank
    #   The rank of the function recommendation option.
    #
    #   The top recommendation option is ranked as `1`.
    #   @return [Integer]
    #
    # @!attribute [rw] memory_size
    #   The memory size, in MB, of the function recommendation option.
    #   @return [Integer]
    #
    # @!attribute [rw] projected_utilization_metrics
    #   An array of objects that describe the projected utilization metrics
    #   of the function recommendation option.
    #   @return [Array<Types::LambdaFunctionMemoryProjectedMetric>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/LambdaFunctionMemoryRecommendationOption AWS API Documentation
    #
    class LambdaFunctionMemoryRecommendationOption < Struct.new(
      :rank,
      :memory_size,
      :projected_utilization_metrics)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes an AWS Lambda function recommendation.
    #
    # @!attribute [rw] function_arn
    #   The Amazon Resource Name (ARN) of the current function.
    #   @return [String]
    #
    # @!attribute [rw] function_version
    #   The version number of the current function.
    #   @return [String]
    #
    # @!attribute [rw] account_id
    #   The AWS account ID of the function.
    #   @return [String]
    #
    # @!attribute [rw] current_memory_size
    #   The amount of memory, in MB, that's allocated to the current
    #   function.
    #   @return [Integer]
    #
    # @!attribute [rw] number_of_invocations
    #   The number of times your function code was executed during the
    #   look-back period.
    #   @return [Integer]
    #
    # @!attribute [rw] utilization_metrics
    #   An array of objects that describe the utilization metrics of the
    #   function.
    #   @return [Array<Types::LambdaFunctionUtilizationMetric>]
    #
    # @!attribute [rw] lookback_period_in_days
    #   The number of days for which utilization metrics were analyzed for
    #   the function.
    #   @return [Float]
    #
    # @!attribute [rw] last_refresh_timestamp
    #   The time stamp of when the function recommendation was last
    #   refreshed.
    #   @return [Time]
    #
    # @!attribute [rw] finding
    #   The finding classification of the function.
    #
    #   Findings for functions include:
    #
    #   * <b> <code>Optimized</code> </b> — The function is correctly
    #     provisioned to run your workload based on its current
    #     configuration and its utilization history. This finding
    #     classification does not include finding reason codes.
    #
    #   * <b> <code>NotOptimized</code> </b> — The function is performing at
    #     a higher level (over-provisioned) or at a lower level
    #     (under-provisioned) than required for your workload because its
    #     current configuration is not optimal. Over-provisioned resources
    #     might lead to unnecessary infrastructure cost, and
    #     under-provisioned resources might lead to poor application
    #     performance. This finding classification can include the
    #     `MemoryUnderprovisioned` and `MemoryUnderprovisioned` finding
    #     reason codes.
    #
    #   * <b> <code>Unavailable</code> </b> — Compute Optimizer was unable
    #     to generate a recommendation for the function. This could be
    #     because the function has not accumulated sufficient metric data,
    #     or the function does not qualify for a recommendation. This
    #     finding classification can include the `InsufficientData` and
    #     `Inconclusive` finding reason codes.
    #
    #     <note markdown="1"> Functions with a finding of unavailable are not returned unless
    #     you specify the `filter` parameter with a value of `Unavailable`
    #     in your `GetLambdaFunctionRecommendations` request.
    #
    #      </note>
    #   @return [String]
    #
    # @!attribute [rw] finding_reason_codes
    #   The reason for the finding classification of the function.
    #
    #   <note markdown="1"> Functions that have a finding classification of `Optimized` don't
    #   have a finding reason code.
    #
    #    </note>
    #
    #   Finding reason codes for functions include:
    #
    #   * <b> <code>MemoryOverprovisioned</code> </b> — The function is
    #     over-provisioned when its memory configuration can be sized down
    #     while still meeting the performance requirements of your workload.
    #     An over-provisioned function might lead to unnecessary
    #     infrastructure cost. This finding reason code is part of the
    #     `NotOptimized` finding classification.
    #
    #   * <b> <code>MemoryUnderprovisioned</code> </b> — The function is
    #     under-provisioned when its memory configuration doesn't meet the
    #     performance requirements of the workload. An under-provisioned
    #     function might lead to poor application performance. This finding
    #     reason code is part of the `NotOptimized` finding classification.
    #
    #   * <b> <code>InsufficientData</code> </b> — The function does not
    #     have sufficient metric data for Compute Optimizer to generate a
    #     recommendation. For more information, see the [Supported resources
    #     and requirements][1] in the *AWS Compute Optimizer User Guide*.
    #     This finding reason code is part of the `Unavailable` finding
    #     classification.
    #
    #   * <b> <code>Inconclusive</code> </b> — The function does not qualify
    #     for a recommendation because Compute Optimizer cannot generate a
    #     recommendation with a high degree of confidence. This finding
    #     reason code is part of the `Unavailable` finding classification.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/compute-optimizer/latest/ug/requirements.html
    #   @return [Array<String>]
    #
    # @!attribute [rw] memory_size_recommendation_options
    #   An array of objects that describe the memory configuration
    #   recommendation options for the function.
    #   @return [Array<Types::LambdaFunctionMemoryRecommendationOption>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/LambdaFunctionRecommendation AWS API Documentation
    #
    class LambdaFunctionRecommendation < Struct.new(
      :function_arn,
      :function_version,
      :account_id,
      :current_memory_size,
      :number_of_invocations,
      :utilization_metrics,
      :lookback_period_in_days,
      :last_refresh_timestamp,
      :finding,
      :finding_reason_codes,
      :memory_size_recommendation_options)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes a filter that returns a more specific list of AWS Lambda
    # function recommendations. Use this filter with the
    # `GetLambdaFunctionRecommendations` action.
    #
    # You can use `EBSFilter` with the `GetEBSVolumeRecommendations` action,
    # `JobFilter` with the `DescribeRecommendationExportJobs` action, and
    # `Filter` with the `GetAutoScalingGroupRecommendations` and
    # `GetEC2InstanceRecommendations` actions.
    #
    # @note When making an API call, you may pass LambdaFunctionRecommendationFilter
    #   data as a hash:
    #
    #       {
    #         name: "Finding", # accepts Finding, FindingReasonCode
    #         values: ["FilterValue"],
    #       }
    #
    # @!attribute [rw] name
    #   The name of the filter.
    #
    #   Specify `Finding` to return recommendations with a specific finding
    #   classification (e.g., `NotOptimized`).
    #
    #   Specify `FindingReasonCode` to return recommendations with a
    #   specific finding reason code (e.g., `MemoryUnderprovisioned`).
    #   @return [String]
    #
    # @!attribute [rw] values
    #   The value of the filter.
    #
    #   The valid values for this parameter are as follows, depending on
    #   what you specify for the `name` parameter:
    #
    #   * Specify `Optimized`, `NotOptimized`, or `Unavailable` if you
    #     specify the `name` parameter as `Finding`.
    #
    #   * Specify `MemoryOverprovisioned`, `MemoryUnderprovisioned`,
    #     `InsufficientData`, or `Inconclusive` if you specify the `name`
    #     parameter as `FindingReasonCode`.
    #   @return [Array<String>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/LambdaFunctionRecommendationFilter AWS API Documentation
    #
    class LambdaFunctionRecommendationFilter < Struct.new(
      :name,
      :values)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes a utilization metric of an AWS Lambda function.
    #
    # @!attribute [rw] name
    #   The name of the utilization metric.
    #
    #   The following utilization metrics are available:
    #
    #   * `Duration` - The amount of time that your function code spends
    #     processing an event.
    #
    #   * `Memory` - The amount of memory used per invocation.
    #   @return [String]
    #
    # @!attribute [rw] statistic
    #   The statistic of the utilization metric.
    #
    #   The Compute Optimizer API, AWS Command Line Interface (AWS CLI), and
    #   SDKs return utilization metrics using only the `Maximum` statistic,
    #   which is the highest value observed during the specified period.
    #
    #   The Compute Optimizer console displays graphs for some utilization
    #   metrics using the `Average` statistic, which is the value of `Sum` /
    #   `SampleCount` during the specified period. For more information, see
    #   [Viewing resource recommendations][1] in the *AWS Compute Optimizer
    #   User Guide*. You can also get averaged utilization metric data for
    #   your resources using Amazon CloudWatch. For more information, see
    #   the [Amazon CloudWatch User Guide][2].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/compute-optimizer/latest/ug/viewing-recommendations.html
    #   [2]: https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html
    #   @return [String]
    #
    # @!attribute [rw] value
    #   The value of the utilization metric.
    #   @return [Float]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/LambdaFunctionUtilizationMetric AWS API Documentation
    #
    class LambdaFunctionUtilizationMetric < Struct.new(
      :name,
      :statistic,
      :value)
      SENSITIVE = []
      include Aws::Structure
    end

    # The request exceeds a limit of the service.
    #
    # @!attribute [rw] message
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/LimitExceededException AWS API Documentation
    #
    class LimitExceededException < Struct.new(
      :message)
      SENSITIVE = []
      include Aws::Structure
    end

    # The request must contain either a valid (registered) AWS access key ID
    # or X.509 certificate.
    #
    # @!attribute [rw] message
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/MissingAuthenticationToken AWS API Documentation
    #
    class MissingAuthenticationToken < Struct.new(
      :message)
      SENSITIVE = []
      include Aws::Structure
    end

    # The account is not opted in to AWS Compute Optimizer.
    #
    # @!attribute [rw] message
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/OptInRequiredException AWS API Documentation
    #
    class OptInRequiredException < Struct.new(
      :message)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes a projected utilization metric of a recommendation option,
    # such as an Amazon EC2 instance. This represents the projected
    # utilization of a recommendation option had you used that resource
    # during the analyzed period.
    #
    # Compare the utilization metric data of your resource against its
    # projected utilization metric data to determine the performance
    # difference between your current resource and the recommended option.
    #
    # <note markdown="1"> The `Cpu` and `Memory` metrics are the only projected utilization
    # metrics returned when you run the
    # `GetEC2RecommendationProjectedMetrics` action. Additionally, the
    # `Memory` metric is returned only for resources that have the unified
    # CloudWatch agent installed on them. For more information, see
    # [Enabling Memory Utilization with the CloudWatch Agent][1].
    #
    #  </note>
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent
    #
    # @!attribute [rw] name
    #   The name of the projected utilization metric.
    #
    #   The following projected utilization metrics are returned:
    #
    #   * `Cpu` - The projected percentage of allocated EC2 compute units
    #     that would be in use on the recommendation option had you used
    #     that resource during the analyzed period. This metric identifies
    #     the processing power required to run an application on the
    #     recommendation option.
    #
    #     Depending on the instance type, tools in your operating system can
    #     show a lower percentage than CloudWatch when the instance is not
    #     allocated a full processor core.
    #
    #     Units: Percent
    #
    #   * `Memory` - The percentage of memory that would be in use on the
    #     recommendation option had you used that resource during the
    #     analyzed period. This metric identifies the amount of memory
    #     required to run an application on the recommendation option.
    #
    #     Units: Percent
    #
    #     <note markdown="1"> The `Memory` metric is returned only for resources that have the
    #     unified CloudWatch agent installed on them. For more information,
    #     see [Enabling Memory Utilization with the CloudWatch Agent][1].
    #
    #      </note>
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent
    #   @return [String]
    #
    # @!attribute [rw] timestamps
    #   The time stamps of the projected utilization metric.
    #   @return [Array<Time>]
    #
    # @!attribute [rw] values
    #   The values of the projected utilization metrics.
    #   @return [Array<Float>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/ProjectedMetric AWS API Documentation
    #
    class ProjectedMetric < Struct.new(
      :name,
      :timestamps,
      :values)
      SENSITIVE = []
      include Aws::Structure
    end

    # A summary of a finding reason code.
    #
    # @!attribute [rw] name
    #   The name of the finding reason code.
    #   @return [String]
    #
    # @!attribute [rw] value
    #   The value of the finding reason code summary.
    #   @return [Float]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/ReasonCodeSummary AWS API Documentation
    #
    class ReasonCodeSummary < Struct.new(
      :name,
      :value)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes a recommendation export job.
    #
    # Use the `DescribeRecommendationExportJobs` action to view your
    # recommendation export jobs.
    #
    # Use the `ExportAutoScalingGroupRecommendations` or
    # `ExportEC2InstanceRecommendations` actions to request an export of
    # your recommendations.
    #
    # @!attribute [rw] job_id
    #   The identification number of the export job.
    #   @return [String]
    #
    # @!attribute [rw] destination
    #   An object that describes the destination of the export file.
    #   @return [Types::ExportDestination]
    #
    # @!attribute [rw] resource_type
    #   The resource type of the exported recommendations.
    #   @return [String]
    #
    # @!attribute [rw] status
    #   The status of the export job.
    #   @return [String]
    #
    # @!attribute [rw] creation_timestamp
    #   The timestamp of when the export job was created.
    #   @return [Time]
    #
    # @!attribute [rw] last_updated_timestamp
    #   The timestamp of when the export job was last updated.
    #   @return [Time]
    #
    # @!attribute [rw] failure_reason
    #   The reason for an export job failure.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/RecommendationExportJob AWS API Documentation
    #
    class RecommendationExportJob < Struct.new(
      :job_id,
      :destination,
      :resource_type,
      :status,
      :creation_timestamp,
      :last_updated_timestamp,
      :failure_reason)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes the source of a recommendation, such as an Amazon EC2
    # instance or Auto Scaling group.
    #
    # @!attribute [rw] recommendation_source_arn
    #   The Amazon Resource Name (ARN) of the recommendation source.
    #   @return [String]
    #
    # @!attribute [rw] recommendation_source_type
    #   The resource type of the recommendation source.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/RecommendationSource AWS API Documentation
    #
    class RecommendationSource < Struct.new(
      :recommendation_source_arn,
      :recommendation_source_type)
      SENSITIVE = []
      include Aws::Structure
    end

    # A summary of a recommendation.
    #
    # @!attribute [rw] summaries
    #   An array of objects that describe a recommendation summary.
    #   @return [Array<Types::Summary>]
    #
    # @!attribute [rw] recommendation_resource_type
    #   The resource type of the recommendation.
    #   @return [String]
    #
    # @!attribute [rw] account_id
    #   The AWS account ID of the recommendation summary.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/RecommendationSummary AWS API Documentation
    #
    class RecommendationSummary < Struct.new(
      :summaries,
      :recommendation_resource_type,
      :account_id)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes a projected utilization metric of a recommendation option.
    #
    # <note markdown="1"> The `Cpu` and `Memory` metrics are the only projected utilization
    # metrics returned when you run the
    # `GetEC2RecommendationProjectedMetrics` action. Additionally, the
    # `Memory` metric is returned only for resources that have the unified
    # CloudWatch agent installed on them. For more information, see
    # [Enabling Memory Utilization with the CloudWatch Agent][1].
    #
    #  </note>
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent
    #
    # @!attribute [rw] recommended_instance_type
    #   The recommended instance type.
    #   @return [String]
    #
    # @!attribute [rw] rank
    #   The rank of the recommendation option projected metric.
    #
    #   The top recommendation option is ranked as `1`.
    #
    #   The projected metric rank correlates to the recommendation option
    #   rank. For example, the projected metric ranked as `1` is related to
    #   the recommendation option that is also ranked as `1` in the same
    #   response.
    #   @return [Integer]
    #
    # @!attribute [rw] projected_metrics
    #   An array of objects that describe a projected utilization metric.
    #   @return [Array<Types::ProjectedMetric>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/RecommendedOptionProjectedMetric AWS API Documentation
    #
    class RecommendedOptionProjectedMetric < Struct.new(
      :recommended_instance_type,
      :rank,
      :projected_metrics)
      SENSITIVE = []
      include Aws::Structure
    end

    # A resource that is required for the action doesn't exist.
    #
    # @!attribute [rw] message
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/ResourceNotFoundException AWS API Documentation
    #
    class ResourceNotFoundException < Struct.new(
      :message)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes the destination Amazon Simple Storage Service (Amazon S3)
    # bucket name and object keys of a recommendations export file, and its
    # associated metadata file.
    #
    # @!attribute [rw] bucket
    #   The name of the Amazon S3 bucket used as the destination of an
    #   export file.
    #   @return [String]
    #
    # @!attribute [rw] key
    #   The Amazon S3 bucket key of an export file.
    #
    #   The key uniquely identifies the object, or export file, in the S3
    #   bucket.
    #   @return [String]
    #
    # @!attribute [rw] metadata_key
    #   The Amazon S3 bucket key of a metadata file.
    #
    #   The key uniquely identifies the object, or metadata file, in the S3
    #   bucket.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/S3Destination AWS API Documentation
    #
    class S3Destination < Struct.new(
      :bucket,
      :key,
      :metadata_key)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes the destination Amazon Simple Storage Service (Amazon S3)
    # bucket name and key prefix for a recommendations export job.
    #
    # You must create the destination Amazon S3 bucket for your
    # recommendations export before you create the export job. Compute
    # Optimizer does not create the S3 bucket for you. After you create the
    # S3 bucket, ensure that it has the required permission policy to allow
    # Compute Optimizer to write the export file to it. If you plan to
    # specify an object prefix when you create the export job, you must
    # include the object prefix in the policy that you add to the S3 bucket.
    # For more information, see [Amazon S3 Bucket Policy for Compute
    # Optimizer][1] in the *Compute Optimizer user guide*.
    #
    #
    #
    # [1]: https://docs.aws.amazon.com/compute-optimizer/latest/ug/create-s3-bucket-policy-for-compute-optimizer.html
    #
    # @note When making an API call, you may pass S3DestinationConfig
    #   data as a hash:
    #
    #       {
    #         bucket: "DestinationBucket",
    #         key_prefix: "DestinationKeyPrefix",
    #       }
    #
    # @!attribute [rw] bucket
    #   The name of the Amazon S3 bucket to use as the destination for an
    #   export job.
    #   @return [String]
    #
    # @!attribute [rw] key_prefix
    #   The Amazon S3 bucket prefix for an export job.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/S3DestinationConfig AWS API Documentation
    #
    class S3DestinationConfig < Struct.new(
      :bucket,
      :key_prefix)
      SENSITIVE = []
      include Aws::Structure
    end

    # The request has failed due to a temporary failure of the server.
    #
    # @!attribute [rw] message
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/ServiceUnavailableException AWS API Documentation
    #
    class ServiceUnavailableException < Struct.new(
      :message)
      SENSITIVE = []
      include Aws::Structure
    end

    # The summary of a recommendation.
    #
    # @!attribute [rw] name
    #   The finding classification of the recommendation.
    #   @return [String]
    #
    # @!attribute [rw] value
    #   The value of the recommendation summary.
    #   @return [Float]
    #
    # @!attribute [rw] reason_code_summaries
    #   An array of objects that summarize a finding reason code.
    #   @return [Array<Types::ReasonCodeSummary>]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/Summary AWS API Documentation
    #
    class Summary < Struct.new(
      :name,
      :value,
      :reason_code_summaries)
      SENSITIVE = []
      include Aws::Structure
    end

    # The request was denied due to request throttling.
    #
    # @!attribute [rw] message
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/ThrottlingException AWS API Documentation
    #
    class ThrottlingException < Struct.new(
      :message)
      SENSITIVE = []
      include Aws::Structure
    end

    # @note When making an API call, you may pass UpdateEnrollmentStatusRequest
    #   data as a hash:
    #
    #       {
    #         status: "Active", # required, accepts Active, Inactive, Pending, Failed
    #         include_member_accounts: false,
    #       }
    #
    # @!attribute [rw] status
    #   The new enrollment status of the account.
    #
    #   The following status options are available:
    #
    #   * `Active` - Opts in your account to the Compute Optimizer service.
    #     Compute Optimizer begins analyzing the configuration and
    #     utilization metrics of your AWS resources after you opt in. For
    #     more information, see [Metrics analyzed by AWS Compute
    #     Optimizer][1] in the *AWS Compute Optimizer User Guide*.
    #
    #   * `Inactive` - Opts out your account from the Compute Optimizer
    #     service. Your account's recommendations and related metrics data
    #     will be deleted from Compute Optimizer after you opt out.
    #
    #   <note markdown="1"> The `Pending` and `Failed` options cannot be used to update the
    #   enrollment status of an account. They are returned in the response
    #   of a request to update the enrollment status of an account.
    #
    #    </note>
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html
    #   @return [String]
    #
    # @!attribute [rw] include_member_accounts
    #   Indicates whether to enroll member accounts of the organization if
    #   the account is the management account of an organization.
    #   @return [Boolean]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/UpdateEnrollmentStatusRequest AWS API Documentation
    #
    class UpdateEnrollmentStatusRequest < Struct.new(
      :status,
      :include_member_accounts)
      SENSITIVE = []
      include Aws::Structure
    end

    # @!attribute [rw] status
    #   The enrollment status of the account.
    #   @return [String]
    #
    # @!attribute [rw] status_reason
    #   The reason for the enrollment status of the account. For example, an
    #   account might show a status of `Pending` because member accounts of
    #   an organization require more time to be enrolled in the service.
    #   @return [String]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/UpdateEnrollmentStatusResponse AWS API Documentation
    #
    class UpdateEnrollmentStatusResponse < Struct.new(
      :status,
      :status_reason)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes a utilization metric of a resource, such as an Amazon EC2
    # instance.
    #
    # Compare the utilization metric data of your resource against its
    # projected utilization metric data to determine the performance
    # difference between your current resource and the recommended option.
    #
    # @!attribute [rw] name
    #   The name of the utilization metric.
    #
    #   The following utilization metrics are available:
    #
    #   * `Cpu` - The percentage of allocated EC2 compute units that are
    #     currently in use on the instance. This metric identifies the
    #     processing power required to run an application on the instance.
    #
    #     Depending on the instance type, tools in your operating system can
    #     show a lower percentage than CloudWatch when the instance is not
    #     allocated a full processor core.
    #
    #     Units: Percent
    #
    #   * `Memory` - The percentage of memory that is currently in use on
    #     the instance. This metric identifies the amount of memory required
    #     to run an application on the instance.
    #
    #     Units: Percent
    #
    #     <note markdown="1"> The `Memory` metric is returned only for resources that have the
    #     unified CloudWatch agent installed on them. For more information,
    #     see [Enabling Memory Utilization with the CloudWatch Agent][1].
    #
    #      </note>
    #
    #   * `EBS_READ_OPS_PER_SECOND` - The completed read operations from all
    #     EBS volumes attached to the instance in a specified period of
    #     time.
    #
    #     Unit: Count
    #
    #   * `EBS_WRITE_OPS_PER_SECOND` - The completed write operations to all
    #     EBS volumes attached to the instance in a specified period of
    #     time.
    #
    #     Unit: Count
    #
    #   * `EBS_READ_BYTES_PER_SECOND` - The bytes read from all EBS volumes
    #     attached to the instance in a specified period of time.
    #
    #     Unit: Bytes
    #
    #   * `EBS_WRITE_BYTES_PER_SECOND` - The bytes written to all EBS
    #     volumes attached to the instance in a specified period of time.
    #
    #     Unit: Bytes
    #
    #   * `DISK_READ_OPS_PER_SECOND` - The completed read operations from
    #     all instance store volumes available to the instance in a
    #     specified period of time.
    #
    #     If there are no instance store volumes, either the value is `0` or
    #     the metric is not reported.
    #
    #   * `DISK_WRITE_OPS_PER_SECOND` - The completed write operations from
    #     all instance store volumes available to the instance in a
    #     specified period of time.
    #
    #     If there are no instance store volumes, either the value is `0` or
    #     the metric is not reported.
    #
    #   * `DISK_READ_BYTES_PER_SECOND` - The bytes read from all instance
    #     store volumes available to the instance. This metric is used to
    #     determine the volume of the data the application reads from the
    #     disk of the instance. This can be used to determine the speed of
    #     the application.
    #
    #     If there are no instance store volumes, either the value is `0` or
    #     the metric is not reported.
    #
    #   * `DISK_WRITE_BYTES_PER_SECOND` - The bytes written to all instance
    #     store volumes available to the instance. This metric is used to
    #     determine the volume of the data the application writes onto the
    #     disk of the instance. This can be used to determine the speed of
    #     the application.
    #
    #     If there are no instance store volumes, either the value is `0` or
    #     the metric is not reported.
    #
    #   * `NETWORK_IN_BYTES_PER_SECOND` - The number of bytes received by
    #     the instance on all network interfaces. This metric identifies the
    #     volume of incoming network traffic to a single instance.
    #
    #   * `NETWORK_OUT_BYTES_PER_SECOND` - The number of bytes sent out by
    #     the instance on all network interfaces. This metric identifies the
    #     volume of outgoing network traffic from a single instance.
    #
    #   * `NETWORK_PACKETS_IN_PER_SECOND` - The number of packets received
    #     by the instance on all network interfaces. This metric identifies
    #     the volume of incoming traffic in terms of the number of packets
    #     on a single instance.
    #
    #   * `NETWORK_PACKETS_OUT_PER_SECOND` - The number of packets sent out
    #     by the instance on all network interfaces. This metric identifies
    #     the volume of outgoing traffic in terms of the number of packets
    #     on a single instance.
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/compute-optimizer/latest/ug/metrics.html#cw-agent
    #   @return [String]
    #
    # @!attribute [rw] statistic
    #   The statistic of the utilization metric.
    #
    #   The Compute Optimizer API, AWS Command Line Interface (AWS CLI), and
    #   SDKs return utilization metrics using only the `Maximum` statistic,
    #   which is the highest value observed during the specified period.
    #
    #   The Compute Optimizer console displays graphs for some utilization
    #   metrics using the `Average` statistic, which is the value of `Sum` /
    #   `SampleCount` during the specified period. For more information, see
    #   [Viewing resource recommendations][1] in the *AWS Compute Optimizer
    #   User Guide*. You can also get averaged utilization metric data for
    #   your resources using Amazon CloudWatch. For more information, see
    #   the [Amazon CloudWatch User Guide][2].
    #
    #
    #
    #   [1]: https://docs.aws.amazon.com/compute-optimizer/latest/ug/viewing-recommendations.html
    #   [2]: https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html
    #   @return [String]
    #
    # @!attribute [rw] value
    #   The value of the utilization metric.
    #   @return [Float]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/UtilizationMetric AWS API Documentation
    #
    class UtilizationMetric < Struct.new(
      :name,
      :statistic,
      :value)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes the configuration of an Amazon Elastic Block Store (Amazon
    # EBS) volume.
    #
    # @!attribute [rw] volume_type
    #   The volume type.
    #
    #   This can be `gp2` for General Purpose SSD, `io1` or `io2` for
    #   Provisioned IOPS SSD, `st1` for Throughput Optimized HDD, `sc1` for
    #   Cold HDD, or `standard` for Magnetic volumes.
    #   @return [String]
    #
    # @!attribute [rw] volume_size
    #   The size of the volume, in GiB.
    #   @return [Integer]
    #
    # @!attribute [rw] volume_baseline_iops
    #   The baseline IOPS of the volume.
    #   @return [Integer]
    #
    # @!attribute [rw] volume_burst_iops
    #   The burst IOPS of the volume.
    #   @return [Integer]
    #
    # @!attribute [rw] volume_baseline_throughput
    #   The baseline throughput of the volume.
    #   @return [Integer]
    #
    # @!attribute [rw] volume_burst_throughput
    #   The burst throughput of the volume.
    #   @return [Integer]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/VolumeConfiguration AWS API Documentation
    #
    class VolumeConfiguration < Struct.new(
      :volume_type,
      :volume_size,
      :volume_baseline_iops,
      :volume_burst_iops,
      :volume_baseline_throughput,
      :volume_burst_throughput)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes an Amazon Elastic Block Store (Amazon EBS) volume
    # recommendation.
    #
    # @!attribute [rw] volume_arn
    #   The Amazon Resource Name (ARN) of the current volume.
    #   @return [String]
    #
    # @!attribute [rw] account_id
    #   The AWS account ID of the volume.
    #   @return [String]
    #
    # @!attribute [rw] current_configuration
    #   An array of objects that describe the current configuration of the
    #   volume.
    #   @return [Types::VolumeConfiguration]
    #
    # @!attribute [rw] finding
    #   The finding classification of the volume.
    #
    #   Findings for volumes include:
    #
    #   * <b> <code>NotOptimized</code> </b>—A volume is considered not
    #     optimized when AWS Compute Optimizer identifies a recommendation
    #     that can provide better performance for your workload.
    #
    #   * <b> <code>Optimized</code> </b>—An volume is considered optimized
    #     when Compute Optimizer determines that the volume is correctly
    #     provisioned to run your workload based on the chosen volume type.
    #     For optimized resources, Compute Optimizer might recommend a new
    #     generation volume type.
    #   @return [String]
    #
    # @!attribute [rw] utilization_metrics
    #   An array of objects that describe the utilization metrics of the
    #   volume.
    #   @return [Array<Types::EBSUtilizationMetric>]
    #
    # @!attribute [rw] look_back_period_in_days
    #   The number of days for which utilization metrics were analyzed for
    #   the volume.
    #   @return [Float]
    #
    # @!attribute [rw] volume_recommendation_options
    #   An array of objects that describe the recommendation options for the
    #   volume.
    #   @return [Array<Types::VolumeRecommendationOption>]
    #
    # @!attribute [rw] last_refresh_timestamp
    #   The time stamp of when the volume recommendation was last refreshed.
    #   @return [Time]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/VolumeRecommendation AWS API Documentation
    #
    class VolumeRecommendation < Struct.new(
      :volume_arn,
      :account_id,
      :current_configuration,
      :finding,
      :utilization_metrics,
      :look_back_period_in_days,
      :volume_recommendation_options,
      :last_refresh_timestamp)
      SENSITIVE = []
      include Aws::Structure
    end

    # Describes a recommendation option for an Amazon Elastic Block Store
    # (Amazon EBS) instance.
    #
    # @!attribute [rw] configuration
    #   An array of objects that describe a volume configuration.
    #   @return [Types::VolumeConfiguration]
    #
    # @!attribute [rw] performance_risk
    #   The performance risk of the volume recommendation option.
    #
    #   Performance risk is the likelihood of the recommended volume type
    #   meeting the performance requirement of your workload.
    #
    #   The value ranges from `0` to `5`, with `0` meaning that the
    #   recommended resource is predicted to always provide enough hardware
    #   capability. The higher the performance risk is, the more likely you
    #   should validate whether the recommendation will meet the performance
    #   requirements of your workload before migrating your resource.
    #   @return [Float]
    #
    # @!attribute [rw] rank
    #   The rank of the volume recommendation option.
    #
    #   The top recommendation option is ranked as `1`.
    #   @return [Integer]
    #
    # @see http://docs.aws.amazon.com/goto/WebAPI/compute-optimizer-2019-11-01/VolumeRecommendationOption AWS API Documentation
    #
    class VolumeRecommendationOption < Struct.new(
      :configuration,
      :performance_risk,
      :rank)
      SENSITIVE = []
      include Aws::Structure
    end

  end
end
